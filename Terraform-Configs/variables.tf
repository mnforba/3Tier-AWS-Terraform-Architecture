# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
# Defining CIDR Block for 1st Subnet
variable "subnet_cidr" {
  default = "10.0.1.0/24"
}
# Defining CIDR Block for 2nd Subnet
variable "subnet1_cidr" {
  default = "10.0.2.0/24"
}
# Defining CIDR Block for 3rd Subnet
variable "subnet2_cidr" {
  default = "10.0.3.0/24"
}
# Defining CIDR Block for 4th Subnet
variable "subnet3_cidr" {
  default = "10.0.4.0/24"
}
# Defining CIDR Block for 5th Subnet
variable "subnet4_cidr" {
  default = "10.0.5.0/24"
}
# Defining CIDR Block for 6th Subnet
variable "subnet5_cidr" {
  default = "10.0.6.0/24"
}
############################
## App tier security group ##
############################
variable "ssh-locate" {
  default     = "yourip"
  description = "ip address"
  type        = string
}
####################
## DB Instance    ##
####################
variable "database-instance-class" {
  default     = "db.t2.micro"
  description = "The Database Instance type"
  type        = string
}
####################
##     multi_AZ    #
####################
variable "multi-az-deployment" {
  default     = false
  description = "Create a Standby DB Instance"
  type        = bool
}