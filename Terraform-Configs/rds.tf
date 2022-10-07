# Creating RDS Instance
resource "aws_db_subnet_group" "database-subnet-group" {
  name       = "database subnets"
  subnet_ids = [aws_subnet.database-subnet-1.id, aws_subnet.database-subnet-2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "database-instance" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.database-subnet-group.id
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  multi_az               = true
  name                   = "mydb"
  username               = "username"
  password               = "password"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}