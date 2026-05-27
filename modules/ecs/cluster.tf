resource "aws_ecs_cluster" "app_task_cluster" {
 name = "app-task-cluster" 

 tags = {
   name ="${var.environment}-ecs-cluster"
 }
}