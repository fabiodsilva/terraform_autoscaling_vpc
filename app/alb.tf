resource "aws_security_group" "alb" {
  name        = "ALB-SG"
  description = "Load Balancer SG"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }



  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Load Balancer"
  }
}

resource "aws_lb" "lb" {
  name            = "ALB"
  security_groups = ["${aws_security_group.alb.id}"]
  subnets         = [data.terraform_remote_state.vpc.outputs.subnet_public_id_a, data.terraform_remote_state.vpc.outputs.subnet_public_id_b]
#  load_balancer_type = "network"
  tags = {
    Name = "ALB"
  }
}



resource "aws_lb_target_group" "tg" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.vpc.outputs.vpc_id
 

  health_check  {
    path = "/"
    protocol = "HTTP"
    healthy_threshold = 3
#    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "lbl" {
  load_balancer_arn = "${aws_lb.lb.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg.arn}"
  }
}
