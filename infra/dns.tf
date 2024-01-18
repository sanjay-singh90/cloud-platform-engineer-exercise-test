## This is only for refrence & not being used

# resource "aws_route53_zone" "sample_app_zone" {
#   name = "this-domain.com"
# }

# resource "aws_route53_record" "sample_app_dns" {
#   zone_id = aws_route53_zone.sample_app_zone.zone_id
#   name    = "sample-app"
#   type    = "CNAME"
#   ttl     = "300"
#   records = [kubernetes_ingress_v1.sample_app_ingress.status.0.load_balancer.0.ingress.0.hostname]
# }