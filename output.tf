output "id" {
  value = var.opsgenie_enabled ? opsgenie_api_integration.prometheus[0].id : ""
}

output "api_key" {
  value     = var.opsgenie_enabled ? opsgenie_api_integration.prometheus[0].api_key : ""
  sensitive = true
}
