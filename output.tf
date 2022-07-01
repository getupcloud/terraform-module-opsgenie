output "id" {
  value = opsgenie_api_integration.prometheus.id
}

output "api_key" {
  value     = opsgenie_api_integration.prometheus.api_key
  sensitive = true
}
