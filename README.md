# AWS EC2 instance and Security Group with Terraform


## Local infrastructure deploy

#### Before to deploy, you must set the following AWS environment variables:

```
export AWS_ACCESS_KEY_ID=xxxxxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxx
export REGION=xxxxxxxxxx
```


#### In each terraform plan, you must create terraform.tfvars file with the variables you're going to use:

#### EC2 terraform.tfvars

```
region = "us-east-1"
organization_name = "organization-name"
environment = "test"



availability_zone = "us-east-1a"
instance_type = "t2.micro"
keypair_name = "keypair-test"
instance_ami = "ami-058bd2d568351da34" # debian 12
volume_type = "gp2"
volume_size = "10"
```


#### SG terraform.tfvars

```
region = "us-east-1"
organization_name = "organization-name"
environment = "test"



ingress_port_list = [
  {
    from_port = 22,
    to_port   = 22
  },
  {
    from_port = 80,
    to_port   = 80
  },
  {
    from_port = 443,
    to_port   = 443
  }
]
cidr_blocks = "0.0.0.0/0"
```


#### Then, you can deploy infrastructure:

```
terraform -chdir=terraform/PLAN_NAME init
```

```
terraform -chdir=terraform/PLAN_NAME validate
```

```
terraform -chdir=terraform/PLAN_NAME plan -var-file=terraform.tfvars -out=tfplan
```

```
terraform -chdir=terraform/PLAN_NAME apply "tfplan"
```

## Local infrastructure destroy

```
terraform -chdir=terraform/PLAN_NAME destroy
```