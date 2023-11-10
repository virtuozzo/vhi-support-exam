# vhi-support-exam
## VHI Support Exam sandbox cluster deployment

### Clone the repo and enter the directory.
```
$ git clone https://github.com/virtuozzo/vhi-support-exam
$ cd vhi-support-exam
```
### Edit credentials files.
Generate an SSH keypair named `exam_rsa` in this directory:
```
➜  vhi-support-exam # ssh-keygen 
Generating public/private rsa key pair.
Enter file in which to save the key: ./exam_rsa
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in ./exam_rsa
Your public key has been saved in ./exam_rsa.pub
```
Provide generated keypair `exam_rsa` and `exam_rsa.pub` to the student along with the last two paragraphs of this README.

Edit `00_vars_access.tf` to add openstack credentials for the VHI project.

### Edit resource files.
If necessary, edit `00_vars_vhi_cluster.tf` and `00_vars_bastion.tf` to use flavor and OS image names you have in your cluster.

### Deploy the sandbox.
```
$ terraform init && terraform apply
```
After the deployment has finished check your VHI Self Service Panel to find Floating IP address assigned to Bastion VM. 

### Access Bastion VM.
Using provided IP address access Bastion VM via RDP on port 3390.
Optionally access Bastion VM via SSH on port 2228 using the provided SSH key, and use an SSH tunnel to access Admin Panel.
```
ssh -L 8888:10.0.102.10:8888 -N -f <bastion_ip_address> -i .ssh/exam_rsa.pub -p2228
ssh <bastion_ip_address> -i .ssh/exam_rsa.pub -p2228
```

### Access sandbox nodes and Admin Panel
Nodes can be accessed from Bastion VM using SSH. Login: `root`, Password: `Lab_r00t`
* `10.0.102.10` HA IP address
* `10.0.102.11` `node1`
* `10.0.102.12` `node2`
* `10.0.102.13` `node3`
* `10.0.102.14` `node4`

Admin Panel can be accessed from Bastion VM using web browser. Login: `admin`, Password: `Lab_admin`
https://10.0.102.10:8888 (or current primary node's IP address)

