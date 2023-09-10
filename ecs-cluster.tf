provider "aws" {
  region = "us-east-1" # Specify your desired region
}

resource "aws_ecs_cluster" "my_cluster" {
  name = "my-ecs-cluster" # Replace with your cluster name
}
