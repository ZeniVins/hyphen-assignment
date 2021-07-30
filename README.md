# CICD

## Description
- The workflow will build a docker image and push it to Docker hub registry.
- It will run a test (test file test.sh) to check that the application is accessible when the container is running.
- Then in the cd part it will start inside the github action runner a minikube cluster (I do the deployment locally in the github runner for simplicity here, but normally we should deploy on an external Kubernetes cluster).
- Then it will use Terraform to deploy a pod and a service on the Minikube cluster.
- Then we test that the service is accessible.

## How to test
- Clone this repository
- create a new branch ``git checkout -b mytest````
- Modify the text in index.html file
- Commit and push your branch
- Create a pull request
- Merge it


# AWS Config

An aws user s3-kms-user was created and attached to the policy policy-s3-kms (the json of the policy is in the root folder) 

I will share credentials of aws user s3-kms-user by email.

s3 bucket: s3://hyphen-assignment-s3-bucket
KMS key ARN : arn:aws:kms:ap-southeast-1:146302787764:key/a39c3313-eedd-4bb8-a227-f542795026f5

After login as s3-kms-user you can download s3://hyphen-assignment-s3-bucket/credentials-encrypted.yaml and decrypt it with
``` sops -k arn:aws:kms:ap-southeast-1:146302787764:key/a39c3313-eedd-4bb8-a227-f542795026f5 -d --output credentials-decrypted.yaml  credentials-encrypted.yaml ```