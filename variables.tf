variable "role_name" {
  description = "The name of the IAM role to create. If nothing is passed, the default name of 'AWSGithubActionsRunner' is used"
  type        = string
  default     = "AWSGithubActionsRunner"
}

variable "role_path" {
  description = "Path to the IAM role if not using the root (default) path. Defaults to '/'"
  type        = string
  default     = "/"
}

variable "repository_name" {
  description = "The repository name in the format of <repoorg/reponame> to grant access to the IAM role. For example, for adhoc repos it would be adhocteam/my-amazing-repository. Required."
  type        = string
}

variable "repository_access_type" {
  description = "Level of access to grant the repository. Set to 'branch' to grant access to only one branch or 'all' to grant access to all branches. Defaults to 'all'"
  type        = string
  default     = "all"
}

variable "repository_access_branch" {
  description = "The branch name that is allowed to use the IAM role. Required if repository_access_type is set to 'branch'."
  type        = string
  default     = ""
}

variable "github_oidc_provider_arn" {
  description = "The ARN for the Github OIDC provider. Required."
  type        = string
}

variable "preset_permission_level" {
  description = "Preset permission level to attach to the IAM role. Can be either 'FullAdministrator', 'PowerUserWithIAM', 'PowerUser', or 'None'. Defaults to 'None'"
  type        = string
  default     = "None"
}

variable "extra_iam_policies" {
  description = "Optional list of IAM policy JSON encoded strings to attach as inline role policies to the new role. When creating multiple policies, the policy name must not overlap."
  type = list(object({
    policy_name   = string
    policy_object = string
  }))
  default = []
}

