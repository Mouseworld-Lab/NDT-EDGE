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
variable "flavor_edge"               { default = "Edgev3" }
variable "image_edge"                { default = "Ubuntu 22.04"}
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
variable "r2-gateway"    { default = "r2-gateway" }
#variable "edge-client"   { default = "edge-client" }


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

data "openstack_networking_network_v2" "r2-gateway" {
  name = var.r2-gateway
}
# ----------------------- Subredes  -----------------------

data "openstack_networking_subnet_v2" "subnet_mgmt_network" {
  name       = "management-subnet"
  network_id = data.openstack_networking_network_v2.mgmt_network.id
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

data "openstack_networking_subnet_v2" "subnet_r2-gateway" {
  name       = "r2-gateway"
  network_id = data.openstack_networking_network_v2.r2-gateway.id
}

# ----------------------- Interfaces  -----------------------


resource "openstack_networking_port_v2" "ens4_r1" {
  name       = "ens4"
  network_id = data.openstack_networking_network_v2.r1r4.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r4.id                
    ip_address = "192.168.3.1"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens5_r1" {
  name       = "ens5"
  network_id = data.openstack_networking_network_v2.r1r2.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r2.id                
    ip_address = "192.168.4.1"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens6_r1" {
  name       = "ens6"
  network_id = data.openstack_networking_network_v2.r1r11.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r11.id                
    ip_address = "192.168.1.1"
  }
  security_group_ids = []
  port_security_enabled  = false
}
# ----------------------- r2  -----------------------
resource "openstack_networking_port_v2" "ens4_r2" {
  name       = "ens4"
  network_id = data.openstack_networking_network_v2.r2-gateway.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2-gateway.id                
    ip_address = "192.168.15.20"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens5_r2" {
  name       = "ens5"
  network_id = data.openstack_networking_network_v2.r2r12.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r12.id                
    ip_address = "192.168.13.20"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens6_r2" {
  name       = "ens6"
  network_id = data.openstack_networking_network_v2.r1r2.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r2.id                
    ip_address = "192.168.4.20"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens7_r2" {
  name       = "ens7"
  network_id = data.openstack_networking_network_v2.r2r3.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r3.id                
    ip_address = "192.168.8.20"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens8_r2" {
  name       = "ens8"
  network_id = data.openstack_networking_network_v2.r2r5.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r5.id                
    ip_address = "192.168.6.20"
  }
  security_group_ids = []
  port_security_enabled  = false
}
# ----------------------- r3  -----------------------
resource "openstack_networking_port_v2" "ens4_r3" {
  name       = "ens4"
  network_id = data.openstack_networking_network_v2.r3r13.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r13.id                
    ip_address = "192.168.12.3"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens5_r3" {
  name       = "ens5"
  network_id = data.openstack_networking_network_v2.r3r7.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r7.id                
    ip_address = "192.168.10.3"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens6_r3" {
  name       = "ens6"
  network_id = data.openstack_networking_network_v2.r2r3.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r3.id                
    ip_address = "192.168.8.3"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens7_r3" {
  name       = "ens7"
  network_id = data.openstack_networking_network_v2.r3r12.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r12.id                
    ip_address = "192.168.14.3"
  }
  security_group_ids = []
  port_security_enabled  = false
}
# ----------------------- r4  -----------------------

resource "openstack_networking_port_v2" "ens4_r4" {
  name       = "ens4"
  network_id = data.openstack_networking_network_v2.r1r4.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r4.id                
    ip_address = "192.168.3.4"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens5_r4" {
  name       = "ens5"
  network_id = data.openstack_networking_network_v2.r11r4.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r11r4.id                
    ip_address = "192.168.2.4"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens6_r4" {
  name       = "ens6"
  network_id = data.openstack_networking_network_v2.r4r6.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r4r6.id                
    ip_address = "192.168.5.4"
  }
  security_group_ids = []
  port_security_enabled  = false
}
# ----------------------- r5  -----------------------

resource "openstack_networking_port_v2" "ens4_r5" {
  name       = "ens4"
  network_id = data.openstack_networking_network_v2.r5r6.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r5r6.id                
    ip_address = "192.168.7.5"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens5_r5" {
  name       = "ens5"
  network_id = data.openstack_networking_network_v2.r2r5.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r5.id                
    ip_address = "192.168.6.5"
  }
  security_group_ids = []
  port_security_enabled  = false
}
# ----------------------- r6  -----------------------
resource "openstack_networking_port_v2" "ens4_r6" {
  name       = "ens4"
  network_id = data.openstack_networking_network_v2.r6r7.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r6r7.id                
    ip_address = "192.168.9.6"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens5_r6" {
  name       = "ens5"
  network_id = data.openstack_networking_network_v2.r5r6.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r5r6.id                
    ip_address = "192.168.7.6"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens6_r6" {
  name       = "ens6"
  network_id = data.openstack_networking_network_v2.r4r6.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r4r6.id                
    ip_address = "192.168.5.6"
  }
  security_group_ids = []
  port_security_enabled  = false
}
# ----------------------- r7  -----------------------
resource "openstack_networking_port_v2" "ens4_r7" {
  name       = "ens4"
  network_id = data.openstack_networking_network_v2.r6r7.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r6r7.id                
    ip_address = "192.168.9.7"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens5_r7" {
  name       = "ens5"
  network_id = data.openstack_networking_network_v2.r7r13.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r7r13.id                
    ip_address = "192.168.11.7"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens6_r7" {
  name       = "ens6"
  network_id = data.openstack_networking_network_v2.r3r7.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r7.id                
    ip_address = "192.168.10.7"
  }
  security_group_ids = []
  port_security_enabled  = false
}
# ----------------------- r11  -----------------------

resource "openstack_networking_port_v2" "ens3_r11" {
  name       = "ens3"
  network_id = data.openstack_networking_network_v2.mgmt_network.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_mgmt_network.id                
    ip_address = "192.168.27.175"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens4_r11" {
  name       = "ens4"
  network_id = data.openstack_networking_network_v2.r1r11.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r1r11.id                
    ip_address = "192.168.1.11"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens5_r11" {
  name       = "ens5"
  network_id = data.openstack_networking_network_v2.r11r4.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r11r4.id                
    ip_address = "192.168.2.11"
  }
  security_group_ids = []
  port_security_enabled  = false
}
# ----------------------- r12 -----------------------
resource "openstack_networking_port_v2" "ens4_r12" {
  name       = "ens4"
  network_id = data.openstack_networking_network_v2.r2r12.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2r12.id                
    ip_address = "192.168.13.12"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens5_r12" {
  name       = "ens5"
  network_id = data.openstack_networking_network_v2.r3r12.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r12.id                
    ip_address = "192.168.14.12"
  }
  security_group_ids = []
  port_security_enabled  = false
}
# ----------------------- r13  -----------------------

resource "openstack_networking_port_v2" "ens4_r13" {
  name       = "ens4"
  network_id = data.openstack_networking_network_v2.r3r13.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r3r13.id                
    ip_address = "192.168.12.13"
  }
  security_group_ids = []
  port_security_enabled  = false
}
resource "openstack_networking_port_v2" "ens5_r13" {
  name       = "ens5"
  network_id = data.openstack_networking_network_v2.r7r13.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r7r13.id                
    ip_address = "192.168.11.13"
  }
  security_group_ids = []
  port_security_enabled  = false
}
# ----------------------- gateway  -----------------------
resource "openstack_networking_port_v2" "ens4_gateway" {
  name       = "ens4"
  network_id = data.openstack_networking_network_v2.r2-gateway.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_r2-gateway.id                
    ip_address = "192.168.15.3"
  }
  security_group_ids = []
  port_security_enabled  = false
}
# ----------------------- edge  -----------------------
resource "openstack_networking_port_v2" "ens3_edge" {
  name       = "ens3"
  network_id = data.openstack_networking_network_v2.mgmt_network.id

  fixed_ip {
    subnet_id  = data.openstack_networking_subnet_v2.subnet_mgmt_network.id                
    ip_address = "192.168.27.185"
  }
  security_group_ids = []
  port_security_enabled  = false
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
    port = openstack_networking_port_v2.ens4_r1.id
  }
  network {
    port = openstack_networking_port_v2.ens5_r1.id
  }
  network {
    port = openstack_networking_port_v2.ens6_r1.id
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
    port = openstack_networking_port_v2.ens4_r2.id
  }
  network {
    port = openstack_networking_port_v2.ens5_r2.id
  }
  network {
    port = openstack_networking_port_v2.ens6_r2.id
  }
  network {
    port = openstack_networking_port_v2.ens7_r2.id
  }
  network {
    port = openstack_networking_port_v2.ens8_r2.id
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
    port = openstack_networking_port_v2.ens4_r3.id
  }
  network {
    port = openstack_networking_port_v2.ens5_r3.id
  }
  network {
    port = openstack_networking_port_v2.ens6_r3.id
  }
  network {
    port = openstack_networking_port_v2.ens7_r3.id
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
    port = openstack_networking_port_v2.ens4_r4.id
  }
  network {
    port = openstack_networking_port_v2.ens5_r4.id
  }
  network {
    port = openstack_networking_port_v2.ens6_r4.id
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
    port = openstack_networking_port_v2.ens4_r5.id
  }
  network {
    port = openstack_networking_port_v2.ens5_r5.id
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
    port = openstack_networking_port_v2.ens4_r6.id
  }
  network {
    port = openstack_networking_port_v2.ens5_r6.id
  }
  network {
    port = openstack_networking_port_v2.ens6_r6.id
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
    port = openstack_networking_port_v2.ens4_r7.id
  }
  network {
    port = openstack_networking_port_v2.ens5_r7.id
  }
  network {
    port = openstack_networking_port_v2.ens6_r7.id
  }
  user_data = file("cloud-config-r7.yml")
}

resource "openstack_compute_instance_v2" "r11" {
  name            = "r11"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id
  #mgmt
#  network {
#    uuid = data.openstack_networking_network_v2.mgmt_network.id
#  }

  network {
    port = openstack_networking_port_v2.ens3_r11.id
  }

  #subredes
  network {
    port = openstack_networking_port_v2.ens4_r11.id
  }
  network {
    port = openstack_networking_port_v2.ens5_r11.id
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
    port = openstack_networking_port_v2.ens4_r12.id
  }
  network {
    port = openstack_networking_port_v2.ens5_r12.id
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
    port = openstack_networking_port_v2.ens4_r13.id
  }
  network {
    port = openstack_networking_port_v2.ens5_r13.id
  }
  user_data = file("cloud-config-r13.yml")
}

resource "openstack_compute_instance_v2" "edge" {
  name            = "edge"
  image_id        = data.openstack_images_image_v2.image_edge.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor_edge.id

  #mgmt
#  network {
#    uuid = data.openstack_networking_network_v2.mgmt_network.id
#  }
  network {
    port = openstack_networking_port_v2.ens3_edge.id
  }


  user_data = file("cloud-init-edge.yml")
}


resource "openstack_compute_instance_v2" "gateway" {
  name            = "gateway"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id

  #mgmt
  network {
    uuid = data.openstack_networking_network_v2.mgmt_network.id
  }
  #subredes
  network {
    port = openstack_networking_port_v2.ens4_gateway.id
  }
  user_data = file("cloud-config-gateway.yml")
}