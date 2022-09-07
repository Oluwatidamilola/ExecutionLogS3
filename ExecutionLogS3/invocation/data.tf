data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

data "aws_organizations_organization" "example" {}

output "account_ids" {
  value = data.aws_organizations_organization.example.accounts[*].id
}

#data "aws_s3_bucket" "target_bucket" {
#  ###### NAME OF THE BUCKET FROM AWS CONSOLE THAT YOU WANT TO BE ADDED TO THE VARIABLE INSIDE POLICIES FOLDER , YOU CANNOT SELF TARGET THIS MODULE INVOCATION
#  ###### SO YOU INSTEAD LOOK FOR A BUCKET ON THE CONSOLE AND GET IT DYNAMICALLY (ALLOWS SELF BUCKET REFERENCE)
#  bucket = ""
#}