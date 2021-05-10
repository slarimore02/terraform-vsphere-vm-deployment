# AVI Controller Deployment on vSphere Terraform module
This Terraform module creates a specified  number of VMs on vSphere

## Module Functions
# Environment Requirements

## vSphere
The following are vSphere prerequisites for running this module:
* vSphere Account with permissions to create VMs and any other vSphere resources created by this module
* Port Group indentified

## vSphere Authentication
For authenticating to vSphere both the vsphere_username and vsphere_password variables will be used. The credentials must have the following permissions in vSphere:

## VM Image
The VM image for vSphere should be uploaded to a vSphere Content Library before running this module with the content library name and image name specified in the respective content_library and vm_template variables. 
## Host OS 
The following packages must be installed on the host operating system:
* curl 

# Usage
```hcl
terraform {
  backend "local" {
  }
}
module "vsphere-vm-deployment" {
  source  = "slarimore02/vm-deployment/vsphere"
  version = "1.0.x"
  
  vm_count           = 3
  vm_cpu_count       = "4"
  vm_memory          = "8"
  vm_password        = "PASSWORD"
  vm_username        = "USERNAME"
  vsphere_datacenter = "DATACENTER"
  content_library    = "CONTENT_LIBRARY_NAME"
  vm_template        = "TEMPLATE"
  vm_datastore       = "DATASTORE"
  name_prefix        = "PREFIX"
  vm_portgroup       = "PORTGROUP"
  compute_cluster    = "CLUSTER"
  vm_folder          = "FOLDER"
  vsphere_user       = "USERNAME"
  vsphere_password   = "PASSWORD"
  vsphere_server     = "VCENTER_ADDRESS"
}


output "controllers" {
  value = module.vsphere-vm-deployment.vm_ips
}
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.6 |
| null | 3.0.0 |
| vsphere | ~> 1.26.0 |

## Providers

| Name | Version |
|------|---------|
| vsphere | ~> 1.26.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| boot\_disk\_size | The boot disk size for the Avi controller | `number` | `25` | no |
| compute\_cluster | The name of the vSphere cluster that the Avi Controllers will be deployed to | `string` | `null` | no |
| content\_library | The name of the Content Library that has the VM Image | `string` | n/a | yes |
| name\_prefix | This prefix is appended to the names of the VMs | `string` | n/a | yes |
| vm\_count | The number of VMs to deploy | `number` | `1` | no |
| vm\_cpu\_count | The number of CPUs for the VMs | `string` | `"2"` | no |
| vm\_datastore | The vSphere Datastore that will back the VMs | `string` | n/a | yes |
| vm\_folder | The folder that the VMs will be placed in. This will be the full path and name of the folder that will be created | `string` | n/a | yes |
| vm\_memory | The amount of memory for the VMs in megabytes | `string` | `"4096"` | no |
| vm\_portgroup | The vSphere portgroup name that the VMs will use | `string` | n/a | yes |
| vm\_resource\_pool | The Resource Pool that the VMs will be deployed to | `string` | `""` | no |
| vm\_template | The name of the VM Image that is hosted in a Content Library | `string` | n/a | yes |
| vsphere\_datacenter | The vSphere Datacenter that the VMs will be deployed | `string` | n/a | yes |
| vsphere\_password | The password for the user account that will be used for creating vSphere resources | `string` | n/a | yes |
| vsphere\_server | The IP Address or FQDN of the VMware vCenter server | `string` | n/a | yes |
| vsphere\_user | The user account that will be used to create the Avi Controller(s) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vm\_ips | The IP Address(es) of the VMs created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->