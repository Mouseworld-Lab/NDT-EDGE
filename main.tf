terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.0"  
    }
  }
}

provider "openstack" {
  auth_url    = "http://192.168.27.44:5000/v3/auth/tokens"
  tenant_name = "admin"
  user_name   = "admin"
  password    = "openstack-ndt"
  domain_name = "Default"
  region      = "RegionOne"
}

variable "image_name"   { default = "Ubuntu 22.04" }
variable "flavor_name"  { default = "r4d50v2" }
variable "network_name" { default = "management-network" }



data "openstack_images_image_v2" "image" {
    name = var.image_name
}

data "openstack_compute_flavor_v2" "flavor" {
    name = var.flavor_name    
}

data "openstack_networking_network_v2" "network" {
    name = var.network_name
}


resource "openstack_compute_instance_v2" "vm" {
    count       = 2
    name        = "edge-${count.index + 1}"
    image_id    = data.openstack_images_image_v2.image.id
    flavor_id   = data.openstack_compute_flavor_v2.flavor.id
    security_groups = ["default"]

    network {
        uuid = data.openstack_networking_network_v2.network.id
    }
    user_data = file("cloud-init-edge-${count.index + 1}.yaml")

}

