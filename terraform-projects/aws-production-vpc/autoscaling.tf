# Create Launch Template
resource "aws_launch_template" "app_template" {

  name_prefix = "app-server"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"


  vpc_security_group_ids = [

    aws_security_group.private_ec2_sg.id

  ]
user_data = base64encode(<<-EOF
#!/bin/bash

yum update -y

yum install -y httpd

systemctl start httpd

systemctl enable httpd


echo "<html>
<h1>Cloud Infrastructure Engineer Portfolio</h1>
<h2>AWS ALB + Auto Scaling Deployment</h2>
<p>Deployed using Terraform</p>
</html>" > /var/www/html/index.html

EOF
)

  tag_specifications {

    resource_type = "instance"

    tags = {

      Name = "ASG-Application-Server"

    }

  }

  

}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "app_asg" {


  name = "cloud-portfolio-asg"


  desired_capacity = 2


  max_size = 4


  min_size = 2


  vpc_zone_identifier = [

    aws_subnet.private_a.id,

    aws_subnet.private_b.id

  ]


  launch_template {

    id = aws_launch_template.app_template.id

    version = "$Latest"

  }



  target_group_arns = [

    aws_lb_target_group.app_target_group.arn

  ]


  health_check_type = "ELB"


  tag {

    key = "Name"

    value = "Application-Server"

    propagate_at_launch = true

  }


}
