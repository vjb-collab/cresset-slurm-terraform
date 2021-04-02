# slurm-cresset-v2

This demo terraform scipt will setup and configure an HPC Slurm + Cresset Flare environment for testing and evaluation. It is intended to be deployed to a sandbox environment.    

From Cloud Shell:

```git clone https://github.com/vjb-collab/slurm-cresset-v2.git```

```cd slurm-cresset-v2/tf/examples/basic/```

```terraform init```

```vi basic.tfvars```

 ```make apply```
 
 After the cluster has been setup and configured, put the license in place:  
 
 ```gcloud compute scp  <LICENSEFILE>  controller:~/. --zone=<zone>```
 
 The rest of the configuration takes place on the controller node. On the controller node:
 
 ```sudo mv <LICENSEFILE> /apps/cresset/licenses/.```
 
 ``` cd /apps/ ```
 
 ```sudo chown -R $USER cresset/```
 
 ```sudo chgrp -R $USER cresset/```
 
 ```cd cresset```
 
 ```./start-CEBroker.sh```
 
 ```tail -f cebroker2.log```
 
