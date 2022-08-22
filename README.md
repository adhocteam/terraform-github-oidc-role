# Terraform Github OIDC Role module

## About

This is a Terraform module that simplifies the creation of an IAM role that is compatible with Github's OIDC authentication. Within this module you can customize what permission level to grant the IAM role (and to that extent, the CI runner(s)). When using the module the user can select between 3 pre set permission policies (Full Administrator, PowerUserAccess with IAM access, or PowerUserAccess). 

The module also supports passing in a custom IAM policy document (typically generated with data.aws_iam_policy_document) to be created as a inline role policy. A completely custom IAM role can be created simply by passing in custom IAM policies and then setting the preset permission level to "none"

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
