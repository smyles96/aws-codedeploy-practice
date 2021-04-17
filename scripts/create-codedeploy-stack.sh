# Create the single t1.micro instance with CodeDeploy agent installed
echo "[*] Creating CodeDeploy resources"
aws cloudformation create-stack --stack-name node-app-codedeploy-resources --template-body file://cloudformation-templates/code-deploy.yml --capabilities CAPABILITY_IAM --parameters file://cloudformation-templates/parameters.json

#wait for resources to be created
echo waiting for successful creation of stack
echo "[*] Waiting for resources to be created"
aws cloudformation wait stack-create-complete --stack-name node-app-codedeploy-resources

exit