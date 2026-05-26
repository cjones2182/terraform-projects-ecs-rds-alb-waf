resource "aws_ecr_repository" "cory_repository" {
  name                 = "cory-repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}