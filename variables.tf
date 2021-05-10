variable "name_prefix" {
  description = "This prefix is appended to the names of the VMs"
  type        = string
}
variable "vm_count" {
  description = "The number of VMs to deploy"
  type        = number
  default     = 1
}
variable "vm_cpu_count" {
  description = "The number of CPUs for the VMs"
  type        = string
  default     = "2"
}
variable "vm_memory" {
  description = "The amount of memory for the VMs in megabytes"
  type        = string
  default     = "4096"
}
variable "vsphere_datacenter" {
  description = "The vSphere Datacenter that the VMs will be deployed"
  type        = string
}
variable "vm_resource_pool" {
  description = "The Resource Pool that the VMs will be deployed to"
  type        = string
  default     = ""
}
variable "content_library" {
  description = "The name of the Content Library that has the VM Image"
  type        = string
}
variable "vm_datastore" {
  description = "The vSphere Datastore that will back the VMs"
  type        = string
}
variable "vm_portgroup" {
  description = "The name of the vSphere portgroup the VMs will use for the first NIC"
  type        = string
}
variable "portgroups_additional_nics" {
  description = "A list of vSphere portgroup names that the VMs will use for additional NICs. Additional NICs are optional"
  type        = list(string)
  default     = []
}
variable "vm_folder" {
  description = "The folder that the VMs will be placed in. This will be the full path and name of the folder that will be created"
  type        = string
}
variable "vm_template" {
  description = "The name of the VM Image that is hosted in a Content Library"
  type        = string
}
variable "vsphere_user" {
  description = "The user account that will be used to create the Avi Controller(s)"
  type        = string
}
variable "vsphere_password" {
  description = "The password for the user account that will be used for creating vSphere resources"
  type        = string
  sensitive   = true
}
variable "vsphere_server" {
  description = "The IP Address or FQDN of the VMware vCenter server"
  type        = string
}
variable "compute_cluster" {
  description = "The name of the vSphere cluster that the Avi Controllers will be deployed to"
  type        = string
  default     = null
}
variable "boot_disk_size" {
  description = "The boot disk size for the Avi controller"
  type        = number
  default     = 25
  validation {
    condition     = var.boot_disk_size >= 15
    error_message = "The Controller boot disk size should be greater than or equal to 15 GB."
  }
}