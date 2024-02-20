module "iam" {
  source               = "../../modules/iam"
  ecs_node_role_name   = "ecs-node-iam-role"
  iam_instance_profile = "ecs-ec2-instance-profile"
}