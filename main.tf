terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5"
    }
  }
}

provider "google" {

  credentials = file("/var/lib/jenkins/stage-306209-f155c4859a9d.json")
  project = "stage-306209"
  region  = "us-central1"
  zone    = "us-central1-c"
}
/*resource "google_compute_firewall" "default" {
  name    = "allow-ssh-and-icmp"
  #network = google_compute_network.default.name
  network = google_compute_network.network.self_link
  #project = google_compute_network.network.project
  project = "stage-306209"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080"]
  }
  source_tags = ["web"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}
*/
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  metadata = {
    #startup-script = file("scripts/install-vm.sh")
    startup-script = "echo hi > /test.txt"
  }
    provisioner "file" {
    source      = "."
    destination = "$HOME/"
  }
}
output "app_external_ip" {
  value ="$(google_compute_instance.app.network_instance.0.access_config.0.assigned_nat_ip)"
}
