module "s3" {
  source = "../modules/s3_bucket/v1.0"

  //S3 bucket name
  bucket              = "ssm-execution-logs-${var.region}-${data.aws_caller_identity.current.account_id}"
  block_public_access = true
  kms_master_key_arn  = "" #### KMS KEY ARN TO ENCRYP THE BUCKET WITH
  bucket_policy_rendered = templatefile("${path.module}/policies/s3_bucket_policy.json", {
    bucket_name = "" #data.aws_s3_bucket.target_bucket.bucket ## GO TO DATA.TF FILE AND CHANGE BUCKET NAME TO ONE EXISTING FROM THE CONSOLE WHICH
    ### WILL BE GRANTED ACCESS IN THE S3 BUCKET POLICY
    principal_org_id = data.aws_organizations_organization.example.id
  })

  tags = {
    #Name = Bucket
  }
}
