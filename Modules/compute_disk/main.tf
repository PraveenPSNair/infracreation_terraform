# Create the additional persistent disk
resource "google_compute_disk" "extra_disk" {
  name = var.extra_disk_name
  type = var.extra_disk_type #"pd-ssd"
  # zone = var.extra-disk-zone #"us-central1-a"
  zone = var.zone #"us-central1-a"
  size = var.extra_disk_size #50 # Size in GB

  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}

output "disk_id" {
  value = google_compute_disk.extra_disk.id
}

resource "google_compute_attached_disk" "extra" {
  instance = var.vm_id # VM to attach to
  disk     = google_compute_disk.extra_disk.id
    # Ensure disk is created before attaching
  depends_on = [google_compute_disk.extra_disk]
}