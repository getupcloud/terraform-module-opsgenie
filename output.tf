output "id" {
  value = local.enabled ? opsgenie_api_integration.prometheus[0].id : ""
}

output "api_key" {
  value     = local.enabled ? opsgenie_api_integration.prometheus[0].api_key : ""
  sensitive = true
}
