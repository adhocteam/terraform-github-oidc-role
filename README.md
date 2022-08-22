# Terraform Github OIDC Role module

## About

This is a Terraform module that simplifies the creation of an IAM role that is compatible with Github's OIDC authentication. Within this module you can customize what permission level to grant the IAM role (and to that extent, the CI runner(s)). When using the module the user can select between 3 pre set permission policies (Full Administrator, PowerUserAccess with IAM access, or PowerUserAccess). 

The module also supports passing in a custom IAM policy document (typically generated with data.aws_iam_policy_document) to be created as a inline role policy. A completely custom IAM role can be created simply by passing in custom IAM policies and then setting the preset permission level to "none"

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.6.0, < 5.0.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extra_iam_policies"></a> [extra\_iam\_policies](#input\_extra\_iam\_policies) | Optional list of IAM policy JSON objects to attach as inline role policies to the new role. When creating multiple policies, the policy name must not overlap. | <pre>list(object({<br>    policy_name   = string<br>    policy_object = map(any)<br>  }))</pre> | `[]` | no |
| <a name="input_github_oidc_provider_arn"></a> [github\_oidc\_provider\_arn](#input\_github\_oidc\_provider\_arn) | The ARN for the Github OIDC provider. Required. | `string` | n/a | yes |
| <a name="input_preset_permission_level"></a> [preset\_permission\_level](#input\_preset\_permission\_level) | Preset permission level to attach to the IAM role. Can be either 'FullAdministrator', 'PowerUserWithIAM', 'PowerUser', or 'None'. Defaults to 'None' | `string` | `"None"` | no |
| <a name="input_repository_access_type"></a> [repository\_access\_type](#input\_repository\_access\_type) | Level of access to grant the repository. Set to 'branch' to grant access to only one branch or 'all' to grant access to all branches. Defaults to 'all' | `string` | `"all"` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The repository name in the format of <repoorg/reponame> to grant access to the IAM role. For example, for adhoc repos it would be adhocteam/my-amazing-repository. Required. | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | The name of the IAM role to create. Required. | `string` | n/a | yes |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | Path to the IAM role if not using the root (default) path. Defaults to '/' | `string` | `"/"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
