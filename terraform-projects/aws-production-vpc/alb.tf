resource "aws_lb" "application_lb" {

  name = "cloud-portfolio-alb"

  internal = false

  load_balancer_type = "application"


  security_groups = [

    aws_security_group.alb_sg.id

  ]


  subnets = [

    aws_subnet.public_a.id,

    aws_subnet.public_b.id

  ]


  tags = {

    Name = "Cloud-Portfolio-ALB"

  }

}

# Create Target Group

resource "aws_lb_target_group" "app_target_group" {

  name = "app-target-group"

  port = 80

  protocol = "HTTP"

  vpc_id = aws_vpc.main.id


  health_check {

    path = "/"

    port = "80"

    protocol = "HTTP"

  }


  tags = {

    Name = "Application-Target-Group"

  }

}

# Create ALB Listener

resource "aws_lb_listener" "http_listener" {

  load_balancer_arn = aws_lb.application_lb.arn

  port = 80

  protocol = "HTTP"


  default_action {

    type = "forward"


    target_group_arn = aws_lb_target_group.app_target_group.arn

  }


}