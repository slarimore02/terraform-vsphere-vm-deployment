resource "vsphere_folder" "main" {
  path          = var.vm_folder
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}
resource "vsphere_virtual_machine" "main" {
  count            = var.vm_count
  name             = "${var.name_prefix}-perf-${count.index + 1}"
  resource_pool_id = var.compute_cluster != null ? data.vsphere_compute_cluster.main[0].resource_pool_id : data.vsphere_resource_pool.pool[0].id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = var.vm_cpu_count
  memory           = var.vm_memory
  folder           = vsphere_folder.main.path
  network_interface {
    network_id  = data.vsphere_network.main.id
    ovf_mapping = "Ethernet 1"
  }
  dynamic "network_interface" {
    for_each = toset(var.portgroups_additional_nics)
    content {
      network_id  = data.vsphere_network.additional_nics[network_interface.value].id
      ovf_mapping = "nic-${network_interface.value}"
    }
  }
  lifecycle {
    ignore_changes = [guest_id]
  }
  disk {
    label            = "disk1"
    size             = var.boot_disk_size
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_content_library_item.item.id
  }
  wait_for_guest_net_routable = "false"
}