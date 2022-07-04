variable "customer_name" {
  description = "Customer name"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = ""
}

#variable "api_key" {
#  description = "The API Key for the Opsgenie Integration. If omitted, the OPSGENIE_API_KEY environment variable is used."
#  type        = string
#  default     = ""
#}

variable "type" {
  description = "Type of the integration (API, Prometheus, etc)"
  type        = string
  default     = "Prometheus"
}

variable "owner_team_name" {
  description = "(Optional) Owner team name of the integration."
  type        = string
}

variable "responder_team_name" {
  description = "(Optional) Team name to receive notifications. Defaults to owner_team_name."
  type        = string
  default     = ""
}

variable "responders" {
  description = "(Optional) User, schedule, teams or escalation names to calculate which users will receive the notifications of the alert."
  type        = set(object({ type = string, id = string }))
  default     = []
}
