# Terraform EC2 Project

**LocalStack**
LocalStack is a tool that emulates AWS services locally. It is primarily used for development, testing, and integration so you can run against AWS-compatible endpoints without incurring AWS costs or needing an internet connection.

**AWS cli**
Aws cli to create initial bucket for terraform

**tflocal**
tflocal wrapper scriptSection titled “tflocal wrapper script”
tflocal is a small wrapper script to run Terraform against LocalStack. tflocal script uses the Terraform Override mechanism and creates a temporary file localstack_providers_override.tf to configure the endpoints for the AWS provider section. The endpoints for all services are configured to point to the LocalStack API (http://localhost:4566 by default). It allows you to easily deploy your unmodified Terraform scripts against LocalStack.

- localstack
  - brew install localstack/tap/localstack-cli
  - localstack auth set-token XXXXXXXXXXXX
  - localstack start
- awscli
  - brew install awscli
  -   export AWS_ACCESS_KEY_ID="test"
      export AWS_SECRET_ACCESS_KEY="test"
      export AWS_DEFAULT_REGION="us-east-1"
  - aws s3 mb s3://tfstate --endpoint-url=http://localhost.localstack.cloud:4566
- terraform-local
  - pip install terraform-local
  - tflocal init/plan/apply

## Project Structure

```
project/
│
├── modules/
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── envs/
    └── dev/
        ├── main.tf
        ├── providers.tf
        ├── variables.tf
        ├── terraform.tfvars
        └── backend.tf

```

## Getting Started

### Prerequisites

- Terraform installed on your machine.
- AWS account with appropriate permissions to create EC2 instances.

### Setup

1. Clone the repository:
   ```
   git clone <repository-url>
   cd terraform-ec2-project
   ```

2. Navigate to the development environment:
   ```
   cd envs/dev
   ```

3. Initialize Terraform:
   ```
   terraform init
   ou
   tflocal init
   ```

4. Review the planned actions:
   ```
   terraform plan
   ou
   tflocal plan
   ```

5. Apply the configuration to create the EC2 instance:
   ```
   terraform apply
   ou
   tflocal apply
   ```

### Configuration

- Modify the `terraform.tfvars` file in the `envs/dev` directory to set your desired variable values, such as instance type and AMI ID.
- The EC2 module can be reused in other environments by creating new directories under `envs` and configuring them similarly.

### Outputs

After applying the configuration, you can view the output values defined in the `outputs.tf` files to get information about the created resources.

### Cleanup

To destroy the resources created by Terraform, run:
```
terraform destroy
ou
tflocal destroy
```

## License

This project is licensed under the MIT License. See the LICENSE file for details.