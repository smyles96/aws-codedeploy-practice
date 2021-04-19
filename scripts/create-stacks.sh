# CodeDeploy stack creation
echo "[*] Creating CodeDeploy stack"
aws cloudformation create-stack --stack-name node-app-codedeploy-resources --template-body file://cloudformation-templates/code-deploy.yml --capabilities CAPABILITY_IAM --parameters file://cloudformation-templates/parameters.json

aws cloudformation wait stack-create-complete --stack-name node-app-codedeploy-resources

# CodePipeline stack creation
echo "[*] Creating CodePipeline stack"
aws cloudformation create-stack --stack-name node-pipeline-stack --template-body file://cloudformation-templates/code-pipeline.yml --capabilities CAPABILITY_IAM --parameters file://cloudformation-templates/parameters.json

aws cloudformation wait stack-create-complete --stack-name node-pipeline-stack

# Obtain ELB URL
echo "[*] ELB url:"
aws cloudformation describe-stacks --stack-name node-app-codedeploy-resources  --query 'Stacks[0].Outputs[?OutputKey==`URL`].OutputValue'

# Finished
exit