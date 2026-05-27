resource "aws_ecs_service" "app_ecs_service" {
  name            = "app-ecs-service"
  cluster         = aws_ecs_cluster.app_task_cluster.id
  task_definition = aws_ecs_task_definition.app_task_definition.arn
  desired_count   = 3

   load_balancer {
    target_group_arn = var.alb_target_group
    container_name   = "cory-container"
    container_port   = 80
   }
   network_configuration {
     subnets = var.private_subnets
     security_groups = [ var.app_security_group ]
   }
}