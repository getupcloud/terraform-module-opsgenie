output "id" {
  value = opsgenie_api_integration.prometheus[0].id
}

output "api_key" {
  value     = opsgenie_api_integration.prometheus[0].api_key
  sensitive = true
}
