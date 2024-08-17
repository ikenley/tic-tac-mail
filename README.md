# tic-tac-mail

This is a simple tic-tac-toe by email app. It answers the question, "could you use email as the client for a REST API instead of a browser?"
The architecture will be quick and simple:

- API server which responds by sending emails (and a de minimis HTTP response that says "your real response is in the mail")
- No back-end database (all state will be stored within the HTTP handshakes)
- The hosting will be serverless AWS resources. Specifically, an API Gateway, a Lambda Function which encapsulates an HTTP server, and SES for sending the emails

## Getting Started

```
# Install aws ecr cli helper
# https://github.com/awslabs/amazon-ecr-credential-helper

# Configure env vars
cp ./.env.example ./.env

# Start docker dependencies
make deps

# Run API service
cd ./api
npm i
npm run start

```

---

## IaC

```
cd ./iac/projects/dev
terraform init
terraform apply
```

---

## CLI commands

```
echo "coming soon"
```
