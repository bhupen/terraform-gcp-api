variable "project_id" {
  type = "string"
}

variable "region" {
  description = "Region to deploy in"
  type        = "string"
}

variable "credentials" {
  description = "Credentials file location"
  type        = "string"
}

provider "google" {
  project     = "${var.project_id}"
  region      = "${var.region}"
  credentials = "${file(var.credentials)}"
}

resource "google_project_services" "project" {
  project = "${var.project_id}"

  services = [
    "storage-component.googleapis.com",
    "bigquery-json.googleapis.com",
    "clouddebugger.googleapis.com",
    "pubsub.googleapis.com",
    "cloudapis.googleapis.com",
    "servicemanagement.googleapis.com",
    "cloudtrace.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "storage-api.googleapis.com",
    "sql-component.googleapis.com",
    "datastore.googleapis.com",
    "compute.googleapis.com",
    "sqladmin.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ]
}
