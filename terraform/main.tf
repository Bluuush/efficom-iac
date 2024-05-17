provider "google" {
  credentials = file("/home/parallels/.config/gcloud/application_default_credentials.json")
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.source_image
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3 python3-pip
    sudo pip3 install ansible
    EOT

  tags = ["http-server", "https-server"]

  metadata = {
    ssh-keys = "terraform:${file("~/.ssh/id_rsa.pub")}"
  }
}
