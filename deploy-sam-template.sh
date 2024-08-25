# Run in app folder, builds serverless application
sam build

# Confirm sam template is valid
sam validate --lint

# Package up the code into S3 bucket
sam package --template-file template.yaml --output-template-file packaged.yaml --s3-bucket s3-lambda-invoke-sample

# Deploy as SAM template in CloudFormation
sam deploy --template-file packaged.yaml --stack-name s3-lambda-invoke-stack --capabilities CAPABILITY_IAM