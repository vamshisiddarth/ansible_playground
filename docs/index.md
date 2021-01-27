This will be your guide to start learning and understanding the ansible playbooks and roles. The roles you find here can be used to build a production grade application infrastructure. We will be using the AWS Dynamic inventory to run the roles on the AWS instances. You can find some simple terraform code to build your basic infrastructure to execute these roles on your own aws account.

## Docker and Docker Compose
We will be deploying most of our services as Docker containers on the aws instances using these Ansible roles. Deploying as container is a very straight forward and simplest approach as you don't really have to deal with the dependencies like libraries, os versions and other dependencies. 

## Terraform
You can find a sample terraform code under `terraform` directory which will help you quickly build your infrastructure on your personal aws account. You may then deploy these services using the ansible roles on the newly created instances.

If you choose to have a dedicated code repository for terraform you may refer to this [repository]().

## Directories

### group_vars 
Declare all the global level variables here.
### terraform
These files help us to create the simple instance on which we can run our Ansible Playbooks.
### ssh
Configuration to ssh proxy to the servers in the vpc using the Bastion instance.
### _ssh
Consists of the Key files which we used to authenticate to the aws server.
### inventory
Dynamic Inventory configuration to identify the aws instances using special naming conventions.
### roles
All the ansible roles will be located here in this directory. 