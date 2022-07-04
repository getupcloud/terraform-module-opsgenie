locals {
  enabled          = var.opsgenie_enabled
  integration_name = var.cluster_name != "" ? "Prometheus - ${var.customer_name}/${var.cluster_name}" : "Prometheus - ${var.customer_name}"
}

data "opsgenie_team" "owner" {
  count = var.opsgenie_enabled ? 1 : 0
  name  = var.owner_team_name
}

data "opsgenie_team" "responder" {
  count = var.opsgenie_enabled ? 1 : 0
  name  = var.responder_team_name != "" ? var.responder_team_name : var.owner_team_name
}

resource "opsgenie_api_integration" "prometheus" {
  count                          = var.opsgenie_enabled ? 1 : 0
  name                           = local.integration_name
  type                           = var.type
  ignore_responders_from_payload = true
  owner_team_id                  = data.opsgenie_team.owner[0].id

  responders {
    type = "team"
    id   = data.opsgenie_team.responder[0].id
  }

  dynamic "responders" {
    for_each = var.responders

    content {
      type = responders.value.type
      id   = responders.value.id
    }
  }

}
