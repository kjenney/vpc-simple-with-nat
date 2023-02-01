# vpc 

1. Make sure you have the latest version of Terraform - at least version 1.2.
2. Make sure you have AWS credentials stored either by environment variable or in ~/.aws/credentials.

Create the VPC by running the following commands:

```
terraform init
terraform apply -auto-approve
```

After running the commands you should see something like this:

```
Apply complete! ...

Get the value of the NAT Public IP addresses 

Outputs:

nat_ip_addresss = tolist([
    .....
])
```

Copy the list of IP addresses.