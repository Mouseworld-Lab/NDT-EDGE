## Twin Network:

To fully set up the digital twin network, you can execute the following Python script 'mw-run.py', which will automatically launch the entire deployment process:
```
 python3 deployment-kne/mw-run.py
 ```
> **Note:**
>  1. It is necessary to load the images of the clients and routers previously in the machine where the topology will be deployed.
> 2. In the deployment-kne/mouseworld_topology/pod-gateway2.yaml file, to enable internet access, we are connecting the pod to its host's interface. You need to modify the interface name accordingly, depending on which interface you want to connect to.
> 3. ***The real time mirroring requires a dummy interface named `mirror` to be created on the worker node. If this interface is not present, the execution of `mw-mirror.yaml` may fail. You can create it manually by running:
>    ```bash
>    sudo ip link add name mirror type dummy
>    sudo ip link set mirror up
>    ```
>  ***This step can be omitted if you do not intend to use the real-time mirroring functionality.