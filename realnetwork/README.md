## Real Network:

Clone this repository and change into the NDT-EDGE/realnetwork directory. Then, initialize Terraform and apply the configuration using the commands below to deploy the real network scenario in OpenStack

```
 terraform init
 terraform apply
 ```
> **Note:**
>  1. The deployed scenario consists of 11 routers running FRRouting software, based on an Ubuntu 22.04 image specially built for this experiment. This image has been previously uploaded to OpenStack.

> 2. The networks are defined in the main.tf file according to the point-to-point connections that establish the reference topology 

> 3. The startup and proper functioning of the virtual machines takes approximately 30 to 40 minutes. You can monitor the boot process by checking the log file with the command 
```
 sudo cat /var/log/cloud-init-output.log
```
When the startup is complete, you will see a message like:
Cloud-init v. 24.4.1-0ubuntu0~22.04.1 finished
