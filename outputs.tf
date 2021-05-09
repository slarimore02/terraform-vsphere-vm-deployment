output "vm_ips" {
  description = "The IP Address(es) of the VMs created"
  value       = vsphere_virtual_machine.main[*].default_ip_address
}