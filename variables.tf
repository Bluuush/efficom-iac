variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "europe-west3"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "europe-west3-a"
}

variable "instance_name" {
  description = "Name of the VM instance"
  type        = string
  default     = "semaphore-vm"
}

variable "machine_type" {
  description = "GCP Machine Type"
  type        = string
  default     = "e2-small"
}

variable "source_image" {
  description = "Source image for the VM"
  type        = string
  default     = "debian-cloud/debian-10"
}
