
#ECS Node Role ---

data "aws_iam_policy_document" "ecs_node" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

/* data "aws_iam_policy_document" "ecs_task" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  } 
} */

resource "aws_iam_role" "ecs_node_role" {
  name               = var.ecs_node_role_name
  assume_role_policy = data.aws_iam_policy_document.ecs_node.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.ecs_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "this" {
  name = var.iam_instance_profile
  path = "/"
  role = aws_iam_role.ecs_node_role.name
}

/* resource "aws_iam_instance_profile" "iam_instance_profile" {
  name        = var.name
  name_prefix = var.name_prefix
  path        = var.path
  role        = var.role
}

resource "aws_iam_role" "ecs_task_role" {
  name_prefix        = var.ecs_task_role_name
  assume_role_policy = data.aws_iam_policy_document.ecs_task_doc.json
}

resource "aws_iam_role" "ecs_exec_role" {
  name_prefix        = var.ecs_exec_role_name
  assume_role_policy = data.aws_iam_policy_document.ecs_task_doc.json
}

resource "aws_iam_role_policy_attachment" "ecs_exec_role_policy" {
  role       = aws_iam_role.ecs_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
} */