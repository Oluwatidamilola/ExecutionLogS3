#########################
### KMS key variables ###
#########################

variable "region" {
  description = "The name of the key alias"
  type        = string
  default     = ""
}

###########################
### S3 Bucket variables ###
###########################

variable "bucket" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name."
}


##################################
### S3 bucket policy variables ###
##################################

variable "block_public_access" {
  description = "Block Public Access enabled on bucket level"
}


variable "kms_master_key_arn" {
    description = "KMS key arn for encrypting S3 bucket"
}

variable "tags" {
  description = "Tags assigned to the Bucket"
}

variable "bucket_policy_rendered" {
    description = "Bucket Policy"

}