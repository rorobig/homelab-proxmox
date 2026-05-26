terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      #latest version as of Nov 30 2022
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  # References our vars.tf file to plug in the api_url 
  pm_api_url = var.api_url
  # References our secrets.tfvars file to plug in our token_id
  pm_api_token_id = var.token_id
  # References our secrets.tfvars to plug in our token_secret 
  pm_api_token_secret = var.token_secret
  # Default to `true` unless you have TLS working within your pve setup 
  pm_tls_insecure = true
}

# Creates a proxmox_vm_qemu entity named blog_demo_test
resource "proxmox_vm_qemu" "blog_demo_test" {
  name = "test-vm-${count.index + 1}" # count.index starts at 0
  #name = "test-vm-01"
  count = 1 # Establishes how many instances will be created 
  target_node = var.proxmox_node

  # References our vars.tf file to plug in our template name
  clone = var.template_name
  # Creates a full clone, rather than linked clone 
  # https://pve.proxmox.com/wiki/VM_Templates_and_Clones
  full_clone = true

  # VM Settings. `agent = 1` enables qemu-guest-agent
  agent = 1
  os_type = "cloud-init"
  ipconfig0 = "ip=dhcp"
  cpu {
    cores = 1
    sockets = 1
  }
  memory = 1048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  bios = "seabios"

  disk {
    slot = "scsi0"
    size = "50G"
    type = "disk"
    storage = "local-lvm" # Name of storage local to the host you are spinning the VM up on
    emulatessd = true
    discard = true
    iothread = true
  }

  disk {
    slot = "ide0"
    type = "cloudinit"
    storage = "local-lvm"
  }

  network {
    id = 0
    model = "virtio"
    bridge = var.nic_name
  }

  serial {
    id = 0
    type = "socket"
  } 

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  #provisioner "local-exec" {
    # Provisioner commands can be run here.
    # We will use provisioner functionality to kick off ansible
    # playbooks in the future
    #command = "touch /home/tcude/test.txt"
  #}
}
