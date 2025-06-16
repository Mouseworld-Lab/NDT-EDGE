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
  tenant_name = "6GedgeDT"
  user_name   = "admin"
  password    = "openstack-ndt"
  domain_name = "Default"
  region      = "RegionOne"
}

variable "image_name"                { default = "HLx-FRR" }
variable "flavor_name"               { default = "FRR" }
variable "flavor_edge"               { default = "Edgev4" }
variable "image_edge"                { default = "Ubuntu 22.04"}
variable "management-network"        { default = "management-network" }


data "openstack_images_image_v2" "image" {
  name = var.image_name
}

data "openstack_images_image_v2" "image_edge" {
  name = var.image_edge
}

data "openstack_compute_flavor_v2" "flavor" {
  name = var.flavor_name
}

data "openstack_compute_flavor_v2" "flavor_edge" {
  name = var.flavor_edge
}

# ----------------------- Redes  -----------------------

data "openstack_networking_network_v2" "mgmt_network" {
  name = var.management-network
}

# ----------------------- Subredes  -----------------------
data "openstack_networking_subnet_v2" "subnet_mgmt_network" {
  name       = "management-subnet"
  network_id = data.openstack_networking_network_v2.mgmt_network.id
}

# ----------------------- Interfaces  ----------------------

# ----------------------- edge-kne  -----------------------
resource "openstack_networking_port_v2" "ens3_edge_kne" {
  name       = "ens3"
  network_id = data.openstack_networking_network_v2.mgmt_network.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_mgmt_network.id                
    ip_address = "192.168.27.187"
  }
  security_group_ids = []
  port_security_enabled  = false
}


# -----------------------
# Instances
# -----------------------

resource "openstack_compute_instance_v2" "edge_kne" {
  name            = "edge_kne"
  image_id        = data.openstack_images_image_v2.image_edge.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor_edge.id

  network {
    port = openstack_networking_port_v2.ens3_edge_kne.id
  }


  user_data = file("cloud-init-edge-kne.yml")
}
