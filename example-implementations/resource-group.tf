module "resource_group" {
  //source = "git::https://github.com/leonardpolz/terraform-governance-framework-core-modules.git//tf-az-resource-group?ref=v1.0.0"
  source = "../tf-az-resource-group"
  resource_groups = [{
    tf_id = "example"
    name_config = {
      values = {
        workload_name = "exampleresourcegroup"
        environment   = "tst"
      }
    }

    role_assignments = [
      {
        principal_id         = "00000000-0000-0000-0000-000000000000"
        role_definition_name = "Contributor"
      },
      {
        principal_id         = "11111111-1111-1111-1111-111111111111"
        role_definition_name = "Reader"
      }
    ]

    tags = {
      terraform_repository_uri = "https://github.com/leonardpolz/terraform-governance-framework-core-modules.git"
      deployed_by              = "Leonard Polz"
      hidden-title             = "Test Resource Group"
    }
  }]
}

output "resource_group_config" {
  value = module.resource_group.resource_group_config_map
}
