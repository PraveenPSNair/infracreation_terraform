variable "projectid" {
  type = string
}
variable "region" {
  type = string
}
variable "instance_name" {
  type = string
}
variable "instance_type" {
  type = string
}
# variable "instance_zone" {
#   type = string
# }
variable "zone" {
  type = string
}
########### For compute_disk ############
variable "boot_disk_image" {
  type = string
}
variable "disk_label" {
  type = string
}

variable "extra_disk_name" {
  type = string
}

variable "extra_disk_type" {
  type = string
}

variable "extra_disk_size" {
  type = number
}
############################################

########### For compute_network ############
variable "vpc_name" {
  type = string
}
variable "primary_subnet" {
  type = string
}
variable "primary_cider_range" {
  type = string

}
############################################