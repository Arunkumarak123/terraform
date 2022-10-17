
module "cloud-nat" {
  source     = "/home/arunkumar/terraform-modules/test"
  project_id = "robust-form-362412"
  region     = "asia-south1"
  router     = "example-router"
}
