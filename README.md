# vhi-support-exam
## VHI Support Exam sandbox cluster deployment
1. Clone the repo and enter the directory.
```
$ git clone https://github.com/virtuozzo/vhi-support-exam
$ cd vhi-support-exam
```
2. Edit credentials files.

Edit `00_vars_access.tf` and `openstack-creds.sh` to add your SSH key and openstack credentials for the VHI project.

4. Edit resource files.

If necessary, edit `00_vars_vhi_cluster.tf` and `00_vars_bastion.tf` to use flavor and OS image names you have in your cluster.

5. Deploy the sandbox.
```
$ terraform init && terraform apply
```

6. Access the sandbox.

Check your VHI Self Service Panel to find Floating IP address assigned to Bastion VM.

Access Bastion VM via RDP on port 3390.

Alternatively access Bastion VM via SSH on port 2228, and create an SSH tunnel for Admin Panel.
```
ssh -L 8888:10.0.102.10:8888 -N -f <bastion_ip_address> -p2228
ssh <bastion_ip_address> -p2228
```
