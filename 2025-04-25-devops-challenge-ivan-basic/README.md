# DevOps - Challenge

## Scenario
You are tasked with setting up a development environment for a new microservice. The microservice will be deployed on a
local Kubernetes cluster and will interact with a PostgreSQL database. The infrastructure should be provisioned using
Terraform.

## Tasks
1) Terraform - Install a local Kubernetes cluster using kind
- Write a Terraform script to provision a local kind cluster with two nodes.
- Verify the cluster is up and running.
2) Terraform - Provision PostgreSQL
- Use Terraform to provision a PostgreSQL database with a strong password in the local kind cluster.
- Expose the PostgreSQL database via port forwarding and verify the PostgreSQL database is up and running.
3) Microservice Deployment
- The microservice docker image is hosted on our GitHub Container Registry (ghcr.io). [See chapter Microservice Image for details](#microservice-image)
- Write a Kubernetes deployment YAML file for the microservice.
- Ensure the microservice can access the PostgreSQL database. Therefor following environment variables must be set: SPRING_DATASOURCE_URL (e.g. jdbc:postgresql://localhost:5432/postgres), SPRING_DATASOURCE_USERNAME, and SPRING_DATASOURCE_PASSWORD
- The microservice should run on two pods.
- Deploy the microservice to the Kubernetes cluster. The deployment method (kubectl, kustomize, helm, terraform, ...) can be freely chosen. Use whatever makes the most sense from your perspective.
4) Validation
- Verify that the microservice is running and can successfully connect to the PostgreSQL database.
- Run basic CRUD operations on the business partner endpoints.
5) Execute the [Case1](#Case-1-endpoint-with-problems) endpoint and fix the error. The endpoint should respond with a 200 status code, indicating a successful request.
6) Execute the [Case2](#Case-2-endpoint-with-problems) endpoint and fix the error. The endpoint should respond with a 200 status code, indicating a successful request.

## Microservice Image
The microservice is implemented with Spring-Boot running on port 8080 for handling incoming requests and provided via a docker image. You can pull the image from our GitHub Container Registry with
the following credentials:

| Parameter | Value                                                             |
|-----------|-------------------------------------------------------------------|
| User      | nevena-nedeljkovic-fioneer                                        |
| Password  | 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                          |
| Image-URL | ghcr.io/nevena-nedeljkovic-fioneer/devops-backend-challenge:0.0.1 |

## Microservice Endpoints

General hints:
- All curl commands are designed for Linux. For Windows, the POST endpoint requires a different escaping.
- No authentication is required for the endpoints.

### Business partners

#### Create a business partner
curl -X POST -H "Content-Type: application/json" http://localhost:8080/v1/businesspartners -d '{"firstName": "John","lastName": "Smith","email": "john.smith@example.com","role": "ADMIN"}'

#### Get all business partners
curl http://localhost:8080/v1/businesspartners

#### Get a business partner by id
curl http://localhost:8080/v1/businesspartners/550e8400-e29b-41d4-a716-446655440000

### Use case endpoints

#### Case 1 (endpoint with problems)
curl http://localhost:8080/v1/usecase/case1

#### Case 2 (endpoint with problems)
curl http://localhost:8080/v1/usecase/case2

## Deliverables
- Terraform script for provisioning the kind cluster.
- Terraform script for deploying PostgreSQL within the kind cluster.
- Kubernetes YAML configuration for the microservice, ensuring a successful deployment.
- Call business partner endpoints.
- Address and resolve endpoint-related issues identified in Case 1 and Case 2.
- Documentation explaining the setup process and any assumptions made.
- Push all changes to your GitHub repository.
