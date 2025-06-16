# Final prototype of an integrated Network Digital Twin (NDT) including the Edge

![INFRA](ArchitectureFinal.png)

# Table of Contents

- [Prerequisites](#prerequisites):
  - [KNE](#kne)
  - [L2S-M](#l2s-m)
  - [OpenStack](#Openstack)
  - [Other requirements](#Other-requirements)
- [Overview of the Demo](#overview-of-the-demo)
- [Demo Video](#demo-video)
- [Deployment Guide](#deployment-guide)

# Prerequisites

## KNE
### Installation

- For installing **KNE**, follow the instructions provided in the official repository: [KNE GitHub Repository](https://github.com/openconfig/kne).

### Tested Environment

This demo was tested on a 1-node cluster with the following configuration:

- **Kubernetes**: v1.27.3
- **Network Plugin**: Flannel CNI
- **Load Balancer**: MetalLB
- **Docker**: Used as the CRI. Refer to the [Docker installation guide](https://docs.docker.com/engine/install/). v20.10.21.
- **Python**: v3.8.10.
- **Go**: v1.20.1.
- **Router Images**: Download the image from [FRRouting](https://docs.frrouting.org/projects/dev-guide/en/latest/building-docker.html). _Tested with the release 10.3_

## L2S-M:
### Installation

- For installing **L2S-M**, follow the instructions provided in the official repository: [L2S-M GitHub Repository](https://github.com/Networks-it-uc3m/L2S-M/tree/main/deployments)

### Tested Environment

This demo was tested on a microK8s cluster with the following configuration:
- **Kubernetes**: MicroK8s v1.31.0 or later. _Tested on a single-node cluster._
- **Network Plugin**: Multus CNI.

## Openstack:

## Other requirements:
The deployment of the scenario has been automated using Ansible and Python. Therefore, both tools must be installed on the machine where you intend to deploy the topology. If they are not already installed, you can install them using the following command:
```
sudo apt install ansible python3
```

# Overview of the Demo
The demonstrator comprises two separate environments: a Real Network and a Twin Network, interconnected through a framework known as the CANDIL Data Fabric. The diagram below illustrates the overall architecture and how its components interact.

![NDT_architecture](NDT_architecture.png)

# Demo Video

# Deployment Guide
Each component is deployed independently following the guides below:
- **Real Network**: OpenStack-based deployment of a virtual network with FRRouting routers, supporting realistic traffic flows including standard and heavy hitter flows.

  - [Real Network Deployment](./realnetwork/README.md)

- **CANDIL Data Fabric**:
Semantic framework for real-time data integration and knowledge graph construction:
  - [mouseworld-kg](https://github.com/Mouseworld-Lab/mouseworld-kg)
  - [mouseworld-ontology](https://github.com/Mouseworld-Lab/mouseworld-ontology)

- **Edge**:
Kubernetes-based edge layer where client pods interface with both networks and generate realistic traffic.
  - [Edge Deployment](./Edge/rn-edge/README.md)
  - [Twin Edge Deployment](./Edge/tn-edge/README.md)

- **Twin Network**: Digital twin of the Real Network, deployed with KNE to emulate network scenarios.
  - [Twin Network Deployment](./deployment-kne/README.md)

## Acknowledgements

This work was supported by:

- **UNICO 5G I+D 6G-EDGEDT**: El Edge hiper distribuido aplicado a gemelos digitales de redes completas de operador. Ministerio de Asuntos Económicos y Transformación Digital. European Union NextGenerationEU.

  ![UNICO](./images/ack-logo.png)