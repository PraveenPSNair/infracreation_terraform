resource "google_service_account" "default" {
  account_id   = "my-custom-sa"
  display_name = "Custom SA for VM Instance"
}

resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.instance_type
  # zone         = var.instance_zone
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      labels = {
        my_label = var.disk_label
      }
    }
  }
  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
# Output the VM id so other modules can use it
output "vm_id" {
  value = google_compute_instance.vm.self_link
}