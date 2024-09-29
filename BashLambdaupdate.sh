#!/bin/bash

# Variables
ROLE_ARN="arn:aws:iam::253462049468:role/nyl-devopsc4e-dev-crossaccount-role"
SESSION_NAME="LambdaUpdateSession"
FUNCTION_NAME="crossAccountLambdaTesting"
ZIP_FILE_PATH="/home/ec2-user/crosspythontest/crossAccountLambdaTesting.zip"
REGION="us-east-1"

# Function to assume the role and get temporary credentials
assume_role() {
        unset AWS_SECRET_ACCESS_KEY
        unset AWS_SESSION_TOKEN
        unset AWS_ACCESS_KEY_ID
    echo "Assuming role $ROLE_ARN..."
    assume_role_output=$(aws sts assume-role --role-arn $ROLE_ARN --role-session-name $SESSION_NAME)

    if [ $? -ne 0 ]; then
        echo "Failed to assume role. Exiting..."
        exit 1
    fi

    #echo "Assume Role Output: $assume_role_output"

    AWS_ACCESS_KEY_ID=$(echo $assume_role_output | jq -r '.Credentials.AccessKeyId')
    AWS_SECRET_ACCESS_KEY=$(echo $assume_role_output | jq -r '.Credentials.SecretAccessKey')
    AWS_SESSION_TOKEN=$(echo $assume_role_output | jq -r '.Credentials.SessionToken')

    if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$AWS_SESSION_TOKEN" ]; then
        echo "Failed to extract temporary credentials. Exiting..."
        exit 1
    fi

    export AWS_ACCESS_KEY_ID
    export AWS_SECRET_ACCESS_KEY
    export AWS_SESSION_TOKEN
	
    echo "Role assumed successfully."
}

update_lambda() {
functions=$(ls -d *)
echo $functions
ls -halt

for function in $functions; do
    cd ${function}; zip -r ../${function}.zip .; cd ..
    echo ${function}
    zipinfo ${function}.zip
    aws lambda update-function-code \
        --function-name $function \
        --zip-file fileb://$function.zip
    exit_status=$?
    if [ $exit_status -eq 0 ]; then
        echo "Lambda function updated successfully."
    else
        echo "Lambda function updated failed."
    fi
done
}

# Main script execution
assume_role
update_lambda
exit $exit_status