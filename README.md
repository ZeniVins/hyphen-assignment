# CICD


# AWS Config

An aws user s3-kms-user was created and attached to the policy policy-s3-kms (the json of the policy is in the root folder) 

Credentials of aws user s3-kms-user:
access key:AKIASEECTMC2NQHB7HTC
secret key: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

s3 bucket: s3://hyphen-assignment-s3-bucket
KMS key ARN : arn:aws:kms:ap-southeast-1:146302787764:key/a39c3313-eedd-4bb8-a227-f542795026f5

After login as s3-kms-user you can download s3://hyphen-assignment-s3-bucket/credentials-encrypted.yaml and decrypt it with
``` sops -k arn:aws:kms:ap-southeast-1:146302787764:key/a39c3313-eedd-4bb8-a227-f542795026f5 -d --output credentials-decrypted.yaml  credentials-encrypted.yaml ```