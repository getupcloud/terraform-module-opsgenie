locals {
  integration_name = var.cluster_name != "" ? "Prometheus - ${var.customer_name}/${var.cluster_name}" : "Prometheus - ${var.customer_name}"
}

data "opsgenie_team" "owner" {
  name = var.owner_team_name
}

data "opsgenie_team" "responder" {
  name = var.responder_team_name != "" ? var.responder_team_name : var.owner_team_name
}

resource "opsgenie_api_integration" "prometheus" {
  name                           = local.integration_name
  type                           = var.type
  ignore_responders_from_payload = true
  owner_team_id                  = data.opsgenie_team.owner.id

  responders {
    type = "team"
    id   = data.opsgenie_team.responder.id
  }

  dynamic "responders" {
    for_each = var.responders

    content {
      type = responders.value.type
      id   = responders.value.id
    }
  }

}
