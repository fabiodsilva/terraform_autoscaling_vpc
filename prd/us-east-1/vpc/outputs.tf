output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_public_id_a" {
  value = aws_subnet.public_a.id
}

output "subnet_public_id_b" {
  value = aws_subnet.public_b.id
}

output "subnet_private_id_a" {
  value = aws_subnet.private_a.id
}

output "subnet_private_id_b" {
  value = aws_subnet.private_b.id
}

