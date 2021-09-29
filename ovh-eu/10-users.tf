resource "ovh_cloud_project_user" "parsley" {
  service_name = data.ovh_cloud_project.condi.id
  description  = "API Client (parsley)"
}

resource "ovh_cloud_project_user" "pure" {
  service_name = data.ovh_cloud_project.condi.id
  description  = "API client (pure)"
}
