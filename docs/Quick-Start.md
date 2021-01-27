## Steps to follow

### Prepare your local machine
Clone the repository on your machine. Use any IDE of your choice. I'm using `Jet Brains Intellij`. Navigate to the repository on the terminal and execute the below.
```sh
./pip-install.sh
```

### Install AWS Plugin
Install the amazon aws plugin using below.
```sh
$ ansible-galaxy collection install amazon.aws
```

### Configure Ansible Vault
Create `vault-password.txt` file with your vault password. Check `vault-password.example.txt` file for reference. The `vault.sh` script can be used to encrypt and decrypt your group_vars file. This will be explained later.

### Configure AWS Credentials
Create `credentials.txt` file with your aws access key and secret key. You may also choose the region of your choice. Check `credentials.example.txt` file for reference.

### Generate Inventory File
Generate the Inventory File for your environment using below.
```sh
$ ./gen-inventory-yaml.sh

Welcome!! You will now be able to generate the credential file for your new environment/account. Please provide the below requested details
environment: stage
aws_access_key_id: AKIARMAHSDVFVEFCDCD                 
aws_secret_access_key: JSADSDdsdmcdc3453422/34e324e3dsacaDFG
iam_role_arn: arn:aws:iam::0912345553223:role/Administrator                                                   
Inventory Credential File created successfully!!
```

### Generate the Key File
Generate the key files which will be used for authentication into the new servers we create.
```sh
$ ./gen-key.sh

Welcome!! You will now be able to generate the key files for your new environment/account. Please provide the below requested details
environment: dev
Generating public/private rsa key pair.
Your identification has been saved in _ssh/dev-env-key.pem.
Your public key has been saved in _ssh/dev-env-key.pem.pub.
The key fingerprint is:
SHA256:eDfWwhh/wLhviuyj6SZ0OaVLu3AdrWioiQkPJOO/TlA vamshisiddarthgaddam@Vamshis-MBP-2
The key's randomart image is:
+---[RSA 2048]----+
|                 |
|         o       |
|   E    o o      |
|  .   .o * o     |
|oo   +o S B o    |
|+.o.*o + + +     |
|ooo+++o   o      |
|o*+++o.. o       |
|= oB*++..        |
+----[SHA256]-----+
Key File created successfully!!
```

### Create A Free Domain
Create a Free Domain for yourself. I have created `vamshi.cf` using [Freenom](https://www.freenom.com/en/index.html?lang=en). We will then create a hosted zone in our AWS account and we need to update the nameservers in freenom with AWS nameservers.

### Update Terraform files
Navigate to the `terraform` directory and update the `vars.tf` and `key-file.tf` with suitable values.
```tf
# key-file.tf

resource "aws_key_pair" "dev-key" {
  key_name   = var.key_name
  public_key = file("./../_ssh/dev-env-key.pem.pub") # This should be your environment key file name
}

# vars.tf

variable "domain_name" {
  default = "vamshi.cf" # Update with your domain name
}
```

### Create AWS Resources using Terraform
Once these files are updated, execute the below to create the new resources in aws.
```
$ ./run.sh apply -auto-approve
```

### Verify DNS Resolution
Once this is done, we need to update the nameservers for the domain. It might take a little time for the domain name to resolve. Once it is successful, you might find similar output.
```sh
$ nslookup bastion.vamshi.cf

Server:         192.168.0.1
Address:        192.168.0.1#53

Non-authoritative answer:
Name:   bastion.vamshi.cf
Address: 54.220.236.92
```

### Confirm SSH Connection
You can now ssh into the newly created instance using the below command.
```sh
$ ssh -F "./ssh/web.ssh.config" ubuntu@172.16.10.120

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jan 26 12:28:15 UTC 2021

  System load:  0.08              Processes:           96
  Usage of /:   14.0% of 7.69GB   Users logged in:     0
  Memory usage: 18%               IP address for ens5: 172.16.10.120
  Swap usage:   0%


0 packages can be updated.
0 updates are security updates.


To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-16-10-120:~$ 
```

With this, you have now completed the Dynamic Inventory configuration. 

