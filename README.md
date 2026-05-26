# homelab-proxmox

Creating templates -> https://tcude.net/creating-a-vm-template-in-proxmox/

Deploying vm's with terraform -> https://tcude.net/using-terraform-with-proxmox/

```
 pveum role modify terraform-role   -privs "VM.Allocate VM.Clone VM.Config.CDROM VM.Config.CPU VM.Config.Cloudinit VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Audit VM.PowerMgmt VM.Migrate Datastore.AllocateSpace Datastore.Audit Pool.Allocate Pool.Audit Sys.Audit Sys.Console Sys.Modify SDN.Use VM.GuestAgent.Audit VM.GuestAgent.Unrestricted"

pveum user add terraform@pve
pveum aclmod / -user terraform@pve -role terraform-role
pveum user token add terraform@pve terraform-token --privsep=0
``` 
