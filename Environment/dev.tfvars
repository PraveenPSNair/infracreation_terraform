projectid       = "my-infracreation"
region          = "us-central1"
zone   = "us-central1-a"
instance_name   = "test-vm"
instance_type   = "n1-standard-1"
#instance_zone   = "us-central1-a"
boot_disk_image = "debian-cloud/debian-11"
disk_label      = "boot-disk"

#module_compute_disk
extra_disk_name = "extra-disk"
extra_disk_type = "pd-ssd"
extra_disk_size =  50

#module_compute_network
vpc_name = "main-vpc"
primary_subnet = "primary-subnet"
primary_cider_range = "10.0.0.0/24"
