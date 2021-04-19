# aws-codedeploy-practice
This repo was setup so I can practice using CodeDeploy and understand the specifics of how it
deploys applications hosted on GitHub. I used [retrofuturejosh's repo](https://github.com/retrofuturejosh/nodepipeline#run-cloudformation-script)
as guidance throughout the process, so all credit to him.

## Development Journal / Process
1) Configured the AWS CLI with a new Access Key ID and Secret
    * https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html
        ```
        aws configure
        ```
2) Generated a new SSH key pair to use with EC2
    * https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair
        ```
        aws ec2 create-key-pair --key-name CodeDeploy-EC2-Pair --query "KeyMaterial" --output text > CodeDeploy-EC2-Pair.pem
        ```
3) Wrote a small variation of retrofuturejosh's Express-based Node app inside the src folder
4) Copied retrofuturejosh's scripts folder to handle starting/stopping server
    * Changed retrofuturejosh's create-stacks.sh to only create CodeDeploy resources (renamed to create-codedeploy-stack.sh)
5) Copied retrofuturejosh's cloudformation-templates/code-deploy.yml file
6) Added a parameters.json file to the cloudformation-templates directory with the following content:
    ```json
    [
        {
            "ParameterKey": "GitHubToken",
            "ParameterValue": <Your GitHub Token>
        },
        {
            "ParameterKey": "GitHubRepoOwner",
            "ParameterValue": <Your GitHub Name>
        },
        {
            "ParameterKey": "GitHubRepoName",
            "ParameterValue": <Name of the GitHub Repo>
        },
        {
            "ParameterKey": "GitHubBranch",
            "ParameterValue": <Name of the Branch>
        },
        {
            "ParameterKey": "EC2KeyName",
            "ParameterValue": "CodeDeploy-EC2-Pair"
        }
    ]
    ```