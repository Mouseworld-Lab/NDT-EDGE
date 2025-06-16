## Edge:


### Deploy of pod ned and proxy in the Edge:
If you have already completed the previous step, you should have the repository cloned. If not, clone this repository and change into the NDT-EDGE/Edge/rn-edge directory. Then, apply the network configuration files that define the Multus networks for edge connectivity, along with the deployment of the pods that enable communication between the previously deployed real network and the edge. 

```
k apply -f /home/edge/NDT-EDGE/Edge/rn-edge/v-network-1.yaml
k apply -f /home/edge/NDT-EDGE/Edge/rn-edge/v-network-2.yaml
k apply -f /home/edge/NDT-EDGE/Edge/rn-edge/vxlan-1.yaml
k apply -f /home/edge/NDT-EDGE/Edge/rn-edge/proxy.yaml
k apply -f /home/edge/NDT-EDGE/Edge/rn-edge/ned.yaml
 ```
> **Note:**
>  1. Make sure to create the networks before deploying the ned and proxy pods, as these pods are associated with the networks.
>  2. Wait until the ned and proxy pods are in a Running state.

### Deploy of clients:

1. **Deploy the 7 clients:**

From the NDT-EDGE/Edge/rn-clients-deployment/clients-conf directory, apply all deployment files and wait until all clients are in the Running state:

```
k apply -f /home/edge/NDT-EDGE/Edge/rn-clients-deployment/clients-conf/
 ```

2. **Generate traffic from the clients:**

In the NDT-EDGE/Edge/rn-clients-deployment directory, execute the Ansible playbook to generate traffic across the real network:

```
ansible-playbook /home/edge/NDT-EDGE/Edge/rn-clients-deployment/ansible-benign-clients-deployment.yaml
 ```
> **Note:**
>  1. Ensure all client pods are running before executing the playbook to avoid traffic generation errors.