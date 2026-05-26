resource "aws_ecs_task_definition" "service" {
   family                   = "test"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn = 
  container_definitions = jsonencode([
    {
      name      = "cory-container"
      image     = 
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }]
    }
  ])
}