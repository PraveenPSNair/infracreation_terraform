# Create a custom VPC network
resource "google_compute_network" "my_vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false # Set to false for custom mode VPC
  mtu                     = 1460  # Optional: Maximum Transmission Unit (MTU)
}

# Create a subnetwork within the custom VPC
resource "google_compute_subnetwork" "primary_subnet" {
  name          = var.primary_subnet
  ip_cidr_range = var.primary_cider_range
  region        = var.region #"us-central1" # Must be in the same region as the network's resources
  network       = google_compute_network.my_vpc_network.self_link # Reference the VPC network

#   # Optional: Define secondary IP ranges for alias IPs
#   secondary_ip_range {
#     range_name    = "secondary-range-1"
#     ip_cidr_range = "10.0.1.0/24"
#   }
}