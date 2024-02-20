

module "security-group" {
  source = "../../modules/security-group"

  sg_name_prefix = "security-group-ecs-*"
  description    = "ecs launch template"

  ingress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "ingress rule"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "ingress rule"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}