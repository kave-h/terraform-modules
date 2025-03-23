# Terraform Modules

This repository contains reusable Terraform modules for provisioning cloud infrastructure, with a focus on AWS.

## 📦 Modules

- [`modules/ec2_instance`](modules/ec2_instance): Deploys an EC2 instance with a security group and SSH key pair.

## 🚀 Quick Start

Each module includes a dedicated example in the `examples/` folder.

To run an example:

```bash
cd examples/<module_name>
terraform init
terraform apply
```

Replace `<module_name>` with the desired module, such as `ec2_instance`.

## 🧪 Testing

This project uses [Terratest](https://github.com/gruntwork-io/terratest) for integration testing. Each module may include its own tests in the `test/` folder.

To run a module’s tests:

```bash
cd test/<module_name>
go mod tidy
go test -v
```

## 🛠 Requirements

- [Terraform](https://www.terraform.io/downloads.html)
- [Go](https://golang.org/dl/)
- AWS credentials with permission to deploy EC2, VPC, and key pairs.

## 📄 License

This project is licensed under the [MIT License](https://mit-license.org/).
