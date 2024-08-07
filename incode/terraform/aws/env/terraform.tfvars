### redis ###
redis_cluster_name   = "testapp"
redis_node_type      = "cache.t4g.micro"
redis_nodes          = 1

### RDS ###
rds_storage        = 10
rds_db_name        = "mydatabase"
rds_engine_version = "8.0"
rds_instance_class = "db.t3.micro"
rds_db_username    = "testappuser"

### VPC ###
subnet_numbers = {
  "eu-west-1a" = 1
  "eu-west-1b" = 2
  #"eu-west-1c" = 3
}
cidr_block           = "10.0.0.0/16"
cidr_public_subnets  = "10.0.0.0/20"
cidr_private_subnets = "10.0.16.0/20"

### EKS ###



