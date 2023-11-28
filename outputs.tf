output "vpc_id" {
  value = module.networking.vpc_id
}

output "private_subnets_id" {
  value = module.networking.private_subnets
}
