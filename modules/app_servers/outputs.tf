# output "instance_id_1" {
#   value = aws_instance.app_server_001.id
# }

# output "instance_id_2" {
#   value = aws_instance.app_server_002.id
# }

output "instance_id" {
  value = aws_instance.web_servers[*].id
}