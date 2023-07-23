resource "google_compute_http_health_check" "lb_health_check" {
  name               = "web-app-health-check"
  request_path       = "/"
  port               = 80
  check_interval_sec = 5
  timeout_sec        = 5
  unhealthy_threshold = 2
  healthy_threshold   = 2
}

resource "google_compute_instance_group" "ec2_instance_group" {
  name        = "web-app-instance-group"
  zone        = var.region  # Specify the correct zone where the instances are located.
  instances   = var.instance_group_members
}

resource "google_compute_backend_service" "lb_backend_service" {
  name       = "web-app-backend-service"
  protocol   = "HTTP"
  timeout_sec = 10

  backend {
    group = google_compute_instance_group.ec2_instance_group.self_link
  }

  health_checks = [google_compute_http_health_check.lb_health_check.self_link]

  # Define backend service configurations as needed.
}


