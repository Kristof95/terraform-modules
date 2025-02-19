variable "LISTENER_ARN" {}
variable "PRIORITY" {}
variable "TARGET_GROUP_ARN" {}

variable "CONDITION_VALUES" {
  type = list
}

resource "aws_lb_listener_rule" "alb_rule" {
  listener_arn = "${var.LISTENER_ARN}"
  priority     = "${var.PRIORITY}"

  action {
    type             = "forward"
    target_group_arn = "${var.TARGET_GROUP_ARN}"
  }

  condition {
    host_header {
      values = var.CONDITION_VALUES
    }
  }
}
