module "launch_template" {
  source                      = "../../modules/launch_template"
  launch_template_name_prefix = "launch-template-ecs-"
  launch_template_description = "ecs launch template"
  ebs_optimized               = true
  image_id                    = "ami-0c7217cdde317cfec"
  vpc_security_group_ids      = [module.security-group.sg_id]
  #user_data              = base64encode("${data.template_file.userdata_rabbitmq.rendered}")
  user_data = base64encode(<<-EOF
      #!/bin/bash
      sudo apt-get update
      sudo apt-get install tomcat9 -y
    EOF
  )
  iam_instance_profile = {
    name = module.iam.instance_profile_name
  }
  key_name = "jenkins"
  #ecs_node_role_name                   = "ecs-instance-role"
  instance_initiated_shutdown_behavior = "terminate"
  block_device_mappings                = var.block_device_mappings
  metadata_options                     = var.metadata_options


  /*   tag_specifications = [
    {
      resource_type = "instance"
      tags = merge(
        var.common_tags,
        map(
          "Name", "${var.source_market_name}-${var.environment}-rabbitmq-ec2-instance",
          "application_service", var.application_service,
          "map-migrated", var.map_credits["mapmigrated"],
          "env", "${var.trips_env[terraform.workspace]}",
          "service", "ec2",
          "crowdstrike_exclude", var.crowdstrike_exclude
        )
      )
    },
    {
      resource_type = "volume"
      tags = merge(
        var.common_tags,
        map(
          "Name", "${var.source_market_name}-${var.environment}-rabbitmq-ec2-instance-volume",
          "application_service", var.application_service,
          "env", "${var.trips_env[terraform.workspace]}",
          "map-migrated", var.map_credits["mapmigrated"],
          "service", "ebsvolumes",
          "crowdstrike_exclude", var.crowdstrike_exclude
        )
      )
    }
  ]

  tags = merge(
    var.common_tags,
    {
      env                 = "${var.trips_env[terraform.workspace]}"
      Name                = "${var.source_market_name}-${var.environment}-launch-template-rabbitmq"
      applicationcategory = "${var.application_service}-launch-template"
      application_service = var.application_service
      service             = "LaunchTemplates"
      "map-migrated"      = "${var.map_credits["mapmigrated"]}"
      crowdstrike_exclude = var.crowdstrike_exclude
    }
  ) */
}