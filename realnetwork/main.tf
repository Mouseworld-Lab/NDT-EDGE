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
variable "management-network"        { default = "management-network" }
variable "r5r6"          { default = "r5r6" }
variable "r2r3"          { default = "r2r3" }
variable "r3r7"          { default = "r3r7" }
variable "r2r5"          { default = "r2r5" }
variable "r4r6"          { default = "r4r6" }
variable "r1r4"          { default = "r1r4" }
variable "r3r13"         { default = "r3r13" }
variable "r3r12"         { default = "r3r12" }
variable "r11r4"         { default = "r11r4" }
variable "r6r7"          { default = "r6r7" }
variable "r2r12"         { default = "r2r12" }
variable "r7r13"         { default = "r7r13" }
variable "r1r11"         { default = "r1r11" }
variable "r1r2"          { default = "r1r2" }



data "openstack_images_image_v2" "image" {
  name = var.image_name
}

data "openstack_compute_flavor_v2" "flavor" {
  name = var.flavor_name
}

data "openstack_networking_network_v2" "mgmt_network" {
  name = var.management-network
}

# ----------------------- Subredes  -----------------------
data "openstack_networking_network_v2" "r5r6" {
  name = var.r5r6
}

data "openstack_networking_network_v2" "r2r3" {
  name = var.r2r3
}

data "openstack_networking_network_v2" "r3r7" {
  name = var.r3r7
}

data "openstack_networking_network_v2" "r2r5" {
  name = var.r2r5
}

data "openstack_networking_network_v2" "r4r6" {
  name = var.r4r6
}

data "openstack_networking_network_v2" "r1r4" {
  name = var.r1r4
}

data "openstack_networking_network_v2" "r3r13" {
  name = var.r3r13
}

data "openstack_networking_network_v2" "r3r12" {
  name = var.r3r12
}

data "openstack_networking_network_v2" "r11r4" {
  name = var.r11r4
}

data "openstack_networking_network_v2" "r6r7" {
  name = var.r6r7
}

data "openstack_networking_network_v2" "r2r12" {
  name = var.r2r12
}

data "openstack_networking_network_v2" "r7r13" {
  name = var.r7r13
}

data "openstack_networking_network_v2" "r1r11" {
  name = var.r1r11
}

data "openstack_networking_network_v2" "r1r2" {
  name = var.r1r2
}


data "openstack_networking_subnet_v2" "subnet_r5r6" {
  name       = "r5r6"
  network_id = data.openstack_networking_network_v2.r5r6.id
}

data "openstack_networking_subnet_v2" "subnet_r2r3" {
  name       = "r2r3"
  network_id = data.openstack_networking_network_v2.r2r3.id
}

data "openstack_networking_subnet_v2" "subnet_r3r7" {
  name       = "r3r7"
  network_id = data.openstack_networking_network_v2.r3r7.id
}

data "openstack_networking_subnet_v2" "subnet_r2r5" {
  name       = "r2r5"
  network_id = data.openstack_networking_network_v2.r2r5.id
}

data "openstack_networking_subnet_v2" "subnet_r4r6" {
  name       = "r4r6"
  network_id = data.openstack_networking_network_v2.r4r6.id
}

data "openstack_networking_subnet_v2" "subnet_r1r4" {
  name       = "r1r4"
  network_id = data.openstack_networking_network_v2.r1r4.id
}

data "openstack_networking_subnet_v2" "subnet_r3r13" {
  name       = "r3r13"
  network_id = data.openstack_networking_network_v2.r3r13.id
}

data "openstack_networking_subnet_v2" "subnet_r3r12" {
  name       = "r3r12"
  network_id = data.openstack_networking_network_v2.r3r12.id
}

data "openstack_networking_subnet_v2" "subnet_r11r4" {
  name       = "r11r4"
  network_id = data.openstack_networking_network_v2.r11r4.id
}

data "openstack_networking_subnet_v2" "subnet_r6r7" {
  name       = "r6r7"
  network_id = data.openstack_networking_network_v2.r6r7.id
}

data "openstack_networking_subnet_v2" "subnet_r2r12" {
  name       = "r2r12"
  network_id = data.openstack_networking_network_v2.r2r12.id
}

data "openstack_networking_subnet_v2" "subnet_r7r13" {
  name       = "r7r13"
  network_id = data.openstack_networking_network_v2.r7r13.id
}

data "openstack_networking_subnet_v2" "subnet_r1r11" {
  name       = "r1r11"
  network_id = data.openstack_networking_network_v2.r1r11.id
}

data "openstack_networking_subnet_v2" "subnet_r1r2" {
  name       = "r1r2"
  network_id = data.openstack_networking_network_v2.r1r2.id
}


# ----------------------- Interfaces  -----------------------


resource "openstack_networking_port_v2" "eth2_r1" {
  name       = "r1_eth2"
  network_id = data.openstack_networking_network_v2.r1r4.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r4.id                
    ip_address = "192.168.3.10"
  }
}
resource "openstack_networking_port_v2" "eth3_r1" {
  name       = "r1_eth3"
  network_id = data.openstack_networking_network_v2.r1r2.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r2.id                
    ip_address = "192.168.4.10"
  }
}
resource "openstack_networking_port_v2" "eth4_r1" {
  name       = "r1_eth4"
  network_id = data.openstack_networking_network_v2.r1r11.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r11.id                
    ip_address = "192.168.1.10"
  }
}

resource "openstack_networking_port_v2" "eth2_r11" {
  name       = "r11_eth2"
  network_id = data.openstack_networking_network_v2.r1r11.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r11.id                
    ip_address = "192.168.1.11"
  }
}
resource "openstack_networking_port_v2" "eth3_r11" {
  name       = "r11_eth3"
  network_id = data.openstack_networking_network_v2.r11r4.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r11r4.id                
    ip_address = "192.168.2.11"
  }
}

resource "openstack_networking_port_v2" "eth2_r4" {
  name       = "r4_eth2"
  network_id = data.openstack_networking_network_v2.r1r4.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r4.id                
    ip_address = "192.168.3.4"
  }
}
resource "openstack_networking_port_v2" "eth3_r4" {
  name       = "r4_eth3"
  network_id = data.openstack_networking_network_v2.r11r4.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r11r4.id                
    ip_address = "192.168.2.4"
  }
}
resource "openstack_networking_port_v2" "eth4_r4" {
  name       = "r4_eth4"
  network_id = data.openstack_networking_network_v2.r4r6.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r4r6.id                
    ip_address = "192.168.5.4"
  }
}

resource "openstack_networking_port_v2" "eth2_r6" {
  name       = "r6_eth2"
  network_id = data.openstack_networking_network_v2.r6r7.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r6r7.id                
    ip_address = "192.168.9.6"
  }
}
resource "openstack_networking_port_v2" "eth3_r6" {
  name       = "r6_eth3"
  network_id = data.openstack_networking_network_v2.r5r6.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r5r6.id                
    ip_address = "192.168.7.6"
  }
}
resource "openstack_networking_port_v2" "eth4_r6" {
  name       = "r6_eth4"
  network_id = data.openstack_networking_network_v2.r4r6.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r4r6.id                
    ip_address = "192.168.5.6"
  }
}

resource "openstack_networking_port_v2" "eth2_r5" {
  name       = "r5_eth2"
  network_id = data.openstack_networking_network_v2.r5r6.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r5r6.id                
    ip_address = "192.168.7.5"
  }
}
resource "openstack_networking_port_v2" "eth3_r5" {
  name       = "r5_eth3"
  network_id = data.openstack_networking_network_v2.r2r5.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r5.id                
    ip_address = "192.168.6.5"
  }
}

resource "openstack_networking_port_v2" "eth2_r2" {
  name       = "r2_eth2"
  network_id = data.openstack_networking_network_v2.r2r12.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r12.id                
    ip_address = "192.168.13.20"
  }
}
resource "openstack_networking_port_v2" "eth3_r2" {
  name       = "r2_eth3"
  network_id = data.openstack_networking_network_v2.r1r2.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r2.id                
    ip_address = "192.168.4.20"
  }
}
resource "openstack_networking_port_v2" "eth4_r2" {
  name       = "r2_eth4"
  network_id = data.openstack_networking_network_v2.r2r3.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r3.id                
    ip_address = "192.168.8.20"
  }
}
resource "openstack_networking_port_v2" "eth5_r2" {
  name       = "r5_eth5"
  network_id = data.openstack_networking_network_v2.r2r5.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r5.id                
    ip_address = "192.168.6.20"
  }
}


resource "openstack_networking_port_v2" "eth2_r3" {
  name       = "r3_eth2"
  network_id = data.openstack_networking_network_v2.r3r13.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r13.id                
    ip_address = "192.168.12.3"
  }
}
resource "openstack_networking_port_v2" "eth3_r3" {
  name       = "r3_eth3"
  network_id = data.openstack_networking_network_v2.r3r7.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r7.id                
    ip_address = "192.168.10.3"
  }
}
resource "openstack_networking_port_v2" "eth4_r3" {
  name       = "r3_eth4"
  network_id = data.openstack_networking_network_v2.r2r3.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r3.id                
    ip_address = "192.168.8.3"
  }
}
resource "openstack_networking_port_v2" "eth5_r3" {
  name       = "r3_eth5"
  network_id = data.openstack_networking_network_v2.r3r12.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r12.id                
    ip_address = "192.168.14.3"
  }
}


resource "openstack_networking_port_v2" "eth2_r7" {
  name       = "r7_eth2"
  network_id = data.openstack_networking_network_v2.r6r7.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r6r7.id                
    ip_address = "192.168.9.7"
  }
}
resource "openstack_networking_port_v2" "eth3_r7" {
  name       = "r7_eth3"
  network_id = data.openstack_networking_network_v2.r7r13.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r7r13.id                
    ip_address = "192.168.11.7"
  }
}
resource "openstack_networking_port_v2" "eth4_r7" {
  name       = "r7_eth4"
  network_id = data.openstack_networking_network_v2.r3r7.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r7.id                
    ip_address = "192.168.10.7"
  }
}


resource "openstack_networking_port_v2" "eth2_r13" {
  name       = "r13_eth2"
  network_id = data.openstack_networking_network_v2.r3r13.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r13.id                
    ip_address = "192.168.12.13"
  }
}
resource "openstack_networking_port_v2" "eth3_r13" {
  name       = "r13_eth3"
  network_id = data.openstack_networking_network_v2.r7r13.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r7r13.id                
    ip_address = "192.168.11.13"
  }
}

resource "openstack_networking_port_v2" "eth2_r12" {
  name       = "r12_eth2"
  network_id = data.openstack_networking_network_v2.r2r12.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r12.id                
    ip_address = "192.168.13.12"
  }
}
resource "openstack_networking_port_v2" "eth4_r12" {
  name       = "r12_eth4"
  network_id = data.openstack_networking_network_v2.r3r12.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r12.id                
    ip_address = "192.168.14.12"
  }
}

# -----------------------
# Instances
# -----------------------

resource "openstack_compute_instance_v2" "r1" {
  name            = "r1"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id

  #mgmt
  network {
    uuid = data.openstack_networking_network_v2.mgmt_network.id
  }
  #subredes
  network {
    port = openstack_networking_port_v2.eth2_r1.id
  }
  network {
    port = openstack_networking_port_v2.eth3_r1.id
  }
  network {
    port = openstack_networking_port_v2.eth4_r1.id
  }
  user_data = file("cloud-config-r1.yml")
}

resource "openstack_compute_instance_v2" "r2" {
  name            = "r2"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id

  #mgmt
  network {
    uuid = data.openstack_networking_network_v2.mgmt_network.id
  }
  #subredes
  network {
    port = openstack_networking_port_v2.eth2_r2.id
  }
  network {
    port = openstack_networking_port_v2.eth3_r2.id
  }
  network {
    port = openstack_networking_port_v2.eth4_r2.id
  }
  network {
    port = openstack_networking_port_v2.eth5_r2.id
  }
  user_data = file("cloud-config-r2.yml")
}

resource "openstack_compute_instance_v2" "r3" {
  name            = "r3"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id

  #mgmt
  network {
    uuid = data.openstack_networking_network_v2.mgmt_network.id
  }
  #subredes
  network {
    port = openstack_networking_port_v2.eth2_r3.id
  }
  network {
    port = openstack_networking_port_v2.eth3_r3.id
  }
  network {
    port = openstack_networking_port_v2.eth4_r3.id
  }
  network {
    port = openstack_networking_port_v2.eth5_r3.id
  }
  user_data = file("cloud-config-r3.yml")
}

resource "openstack_compute_instance_v2" "r4" {
  name            = "r4"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id

  #mgmt
  network {
    uuid = data.openstack_networking_network_v2.mgmt_network.id
  }
  #subredes
  network {
    port = openstack_networking_port_v2.eth2_r4.id
  }
  network {
    port = openstack_networking_port_v2.eth3_r4.id
  }
  network {
    port = openstack_networking_port_v2.eth4_r4.id
  }
  user_data = file("cloud-config-r4.yml")
}

resource "openstack_compute_instance_v2" "r5" {
  name            = "r5"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id

  #mgmt
  network {
    uuid = data.openstack_networking_network_v2.mgmt_network.id
  }
  #subredes
  network {
    port = openstack_networking_port_v2.eth2_r5.id
  }
  network {
    port = openstack_networking_port_v2.eth3_r5.id
  }
  user_data = file("cloud-config-r5.yml")
}

resource "openstack_compute_instance_v2" "r6" {
  name            = "r6"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id

  #mgmt
  network {
    uuid = data.openstack_networking_network_v2.mgmt_network.id
  }
  #subredes
  network {
    port = openstack_networking_port_v2.eth2_r6.id
  }
  network {
    port = openstack_networking_port_v2.eth3_r6.id
  }
  network {
    port = openstack_networking_port_v2.eth4_r6.id
  }
  user_data = file("cloud-config-r6.yml")
}

resource "openstack_compute_instance_v2" "r7" {
  name            = "r7"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id
  #mgmt
  network {
    uuid = data.openstack_networking_network_v2.mgmt_network.id
  }
  #subredes
  network {
    port = openstack_networking_port_v2.eth2_r7.id
  }
  network {
    port = openstack_networking_port_v2.eth3_r7.id
  }
  network {
    port = openstack_networking_port_v2.eth4_r7.id
  }
  user_data = file("cloud-config-r7.yml")
}

resource "openstack_compute_instance_v2" "r11" {
  name            = "r11"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id

  #mgmt
  network {
    uuid = data.openstack_networking_network_v2.mgmt_network.id
  }
  #subredes
  network {
    port = openstack_networking_port_v2.eth2_r11.id
  }
  network {
    port = openstack_networking_port_v2.eth3_r11.id
  }
  user_data = file("cloud-config-r11.yml")
}

resource "openstack_compute_instance_v2" "r12" {
  name            = "r12"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id

  #mgmt
  network {
    uuid = data.openstack_networking_network_v2.mgmt_network.id
  }
  #subredes
  network {
    port = openstack_networking_port_v2.eth2_r12.id
  }
  network {
    port = openstack_networking_port_v2.eth4_r12.id
  }
  user_data = file("cloud-config-r12.yml")
}

resource "openstack_compute_instance_v2" "r13" {
  name            = "r13"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id

  #mgmt
  network {
    uuid = data.openstack_networking_network_v2.mgmt_network.id
  }
  #subredes
  network {
    port = openstack_networking_port_v2.eth2_r13.id
  }
  network {
    port = openstack_networking_port_v2.eth3_r13.id
  }
  user_data = file("cloud-config-r13.yml")
}