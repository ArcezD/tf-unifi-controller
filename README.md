# Deploy your own Unifi Network Controller on AWS using Terraform

## Prerequisites
- [A free tier account in AWS](https://aws.amazon.com/free/)

## (Optional) Create a key pair using AWS CLI
You can use the aws-cli to generate a private key pair for use in your ec2 instance, if you already have an existing ec2 key pair this step is not necessary. You can see other options [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) at the official AWS Documentation.

Use the create-key-pair AWS CLI command as follows to generate the key and save it to a .pem file
```bash
aws ec2 create-key-pair --key-name unifi-key --query "KeyMaterial" --output text > unifi.pem
```
If you will use an SSH client on a macOS or Linux computer to connect to your Linux instance, use the following command to set the permissions of your private key file so that only you can read it. 
```bash
chmod 400 unifi.pem
```

## (Optional) Connect by ssh
To connect 
```bash
ssh -i unifi.pem ubuntu@ec2-34-207-183-77.compute-1.amazonaws.com
```

## References
- [UniFi - Install a UniFi Cloud Controller on Amazon Web Services](https://help.ui.com/hc/en-us/articles/209376117-UniFi-Install-a-UniFi-Cloud-Controller-on-Amazon-Web-Services)
- [Amazon EC2 key pairs and Linux instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)