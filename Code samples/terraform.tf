provider "google" {
  project = "<your-project-id>"
  region  = "<your-region>"
}
resource "google_compute_instance" "web" {
  name         = "web-server"
  machine_type = "f1-micro"
  zone         = "<your-zone>"
  boot_disk {
    initialize_params { image = "ubuntu-os-cloud/ubuntu-1804-lts" }
  }
  provisioner "remote-exec" {
    inline = ["sudo apt-get update", "sudo apt-get install -y nginx"]
  }
}
resource "google_compute_instance" "web" {
  name         = "web-server"
  machine_type = "f1-micro"
  zone         = "<your-zone>"
  boot_disk {
    initialize_params {image = "ubuntu-os-cloud/ubuntu-1804-lts"}
  }
  provisioner "remote-exec" {
    inline = ["sudo apt-get update", "sudo apt-get install -y nginx"]
  }
}
resource "google_compute_firewall" "web" {
    name    = "web"
    network = "default"
    allow { 
      protocol = "tcp"
      ports    = ["80"] 
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["web-server"]
  }
  #Execute with
  #terraform init
  #terraform plan
  #terraform apply
