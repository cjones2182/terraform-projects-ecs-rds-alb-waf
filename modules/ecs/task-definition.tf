resource "aws_ecs_task_definition" "service" {
   family                   = "test"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn = aws_iam_role.ECS_task_Execution_Role.arn
  container_definitions = jsonencode([
    {
      name      = "cory-container"
      image     = "856480644010.dkr.ecr.us-east-1.amazonaws/cory-app:v1"
      cpu       = 256
      memory    = 512
      essential = true
      secrets = [{
        name  = "rds-password"
        valueFrom = var.aws_secretsmanager_secret
      }]
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }]
    }
  ])
}
resource "aws_iam_role" "ECS_task_Execution_Role" {
  name = "ECSTaskExecutionRole"
  assume_role_policy = jsonencode({
     Version = "2012-10-17"
    Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy_attachment" {
  role       = aws_iam_role.ECS_task_Execution_Role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}