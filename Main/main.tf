terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.49.2"
    }
  }
}

provider "google" {
  project = var.projectid
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "mytest_infra"
    prefix = "terraform/state"
  }
}

module "vm_instance" {
  source        = "../Modules/vm_instance"
  instance_name = var.instance_name
  instance_type = var.instance_type
  #instance_zone   = var.instance_zone
  zone            = var.zone
  boot_disk_image = var.boot_disk_image
  disk_label      = var.disk_label

}
module "compute_disk" {
  source          = "../Modules/compute_disk"
  vm_id           = module.vm_instance.vm_id
  extra_disk_name = var.extra_disk_name
  extra_disk_type = var.extra_disk_type
  zone            = var.zone
  extra_disk_size = var.extra_disk_size

}


output "vm_instance_id" {
  value = module.vm_instance.vm_id

}

module "compute_network" {
  region              = var.region
  source              = "../Modules/compute_network"
  vpc_name            = var.vpc_name
  primary_subnet      = var.primary_subnet
  primary_cider_range = var.primary_cider_range

}