# How to deploy a three-tier architecture in AWS using Terraform?

### What is Terraform?

Terraform is an open-source infrastructure as a code (IAC) tool that allows to create, manage & deploy the production-ready environment. Terraform codifies cloud APIs into declarative configuration files. Terraform can manage both existing service providers and custom in-house solutions.

![1](https://github.com/DhruvinSoni30/Terraform-AWS-3tier-Architecture/blob/main/1.png)

In this tutorial, I will deploy a three-tier application in AWS using Terraform.

![2](https://github.com/DhruvinSoni30/Terraform-AWS-3tier-Architecture/blob/main/2.png)

### Prerequisites:

* Basic knowledge of AWS & Terraform
* AWS account
* AWS Access & Secret Key

> In this project, I have used some variables also that I will discuss later in this article.
> You can clone or fork this repository to your local and use the code from the `Terraform-Configs`. 

**Step 1:- Create a file for the VPC**

* Create vpc.tf file and add code from the code base

   
**Step 2:- Create a file for the Subnet**

* For this project, I will create total 6 subnets for the front-end tier and back-end tier with a mixture of public & private subnet
* Create subnet.tf file and code from the code base
  
**Step 3:- Create a file for the Internet Gateway**

* Create igw.tf file and code from the code base

**Step 4:- Create a file for the Route table**

* Create route_table_public.tf file and code from the code base

* In the above code, I am creating a new route table and forwarding all the requests to the 0.0.0.0/0 CIDR block.
* I am also attaching this route table to the subnet created earlier. So, it will work as the Public Subnet

**Step 5:- Create a file for EC2 instances**

* Create ec2.tf file and add the below code to it


**Step 6:- Create a file for Security Group for the FrontEnd tier**

* I have opened 80,443 & 22 ports for the inbound connection and I have opened all the ports for the outbound connection

**Step 7:- Create a file for Security Group for the Database tier**

* I have opened 3306 ports for the inbound connection and I have opened all the ports for the outbound connection.

**Step 8:- Create a file Application Load Balancer**

* Create alb.tf file and code from the code base
* The above load balancer is of type external
* Load balancer type is set to application
* The aws_lb_target_group_attachment resource will attach our instances to the Target Group.
* The load balancer will listen requests on port 80

**Step 9:- Create a file for the RDS instance**

* Create a rds.tf file and code from the code base
* In the above code, you need to change the value of username & password
* multi-az is set to true for the high availability

**Step 10:- Create a file for outputs**

* Create outputs.tf file and code from the code base
  
* From the above code, I will get the DNS of the application load balancer.

**Step 11:- Create a file for variable**

* Create vars.tf file and code from the code base

**Step 12:- Create a file for user data**

* Create data.sh file and code from the code base
 
* The above code will install an apache webserver in the EC2 instances

So, now our entire code is ready. We need to run the below steps to create infrastructure.

* `terraform init` is to initialize the working directory and downloading plugins of the provider
* `terraform plan` is to create the execution plan for our code
* `terraform apply` is to create the actual infrastructure. It will ask you to provide the Access Key and Secret Key in order to create the infrastructure. So, instead of hardcoding the Access Key and Secret Key, it is better to apply at the run time.


**Step 13:- Verify the resources**

* Terraform will create below resources

  * VPC
  * Application Load Balancer
  * Public & Private Subnets
  * EC2 instances
  * RDS instance
  * Route Table
  * Internet Gateway
  * Security Groups for Web & RDS instances
  * Route Table

Once the resource creation finishes you can get the DNS of a load balancer and paste it into the browser and you can see load balancer will send the request to two instances.

That’s it now, you can destroy the infrastructure using `terraform destroy`

 
