provider "google" {
  credentials = "${file("robust-form-362412-74d8b1e1b512.json")}"
  project     = "robust-form-362412"
}

module "google_compute_instance" {
  source          = "/home/arunkumar/vm/arun"
  amount          = 1
  region          = "europe-west4"
  zone            = "europe-west4-c"
  # hostname format: name_prefix-amount
  name_prefix     = "vm"
  machine_type    = "n1-standard-2"
  disk_type       = "pd-ssd"
  disk_size       = "15"
  disk_image      = "centos-cloud/centos-7"

  dns_record_name = "tower-dev"

  user_data       = "firestone-lab"
  username        = "eimert"
  public_key_path = "~/.ssh/id_rsa.pub"
}
