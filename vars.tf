#Set your public SSH key here
variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAS9qEWooi6hdHIJSwhYbHknVYvzr8eiPGVwGFaGA58HHelt1CttYWk6sZ8TDY2vghB2XnYB7gjP4DJFKMP8j8sgtFrmJti6FgwV2gTffIxKKlcYwe1JGOnmSnX8czhankM+J3x8QJX1ZYKezOMw60GGZWtxOjQlzR150RRTXMiuN9uir9IuGr4EYznSa11Pm7vzrTnxahmI4u5G/n+yGeGYtGZx2KjmSJN5lIrUc61pbXfw3+oRaZoG7bfTA9z+4vBZiYEhmegBXJqwCD0c5WsNDKqSfdjgR9eMP0OigT2DKrOtumbpwJcfkLkXlMt2lfcEdHZKfjFxeJw5xtgwtiHmTmCnhdVja5SFKUsDvHUFs7b1caMYmlR/jl27kpW8+24/tFetxGeZJsFcVJmqWkhJNfYvGBuiYZfM6ZgGds7/1V1LYVtiTJVR6uWV8vCtwLWI7Qkrcir7chyhrm7942LMuLRUhiwrafHaWwoip6zoAhc9CvmKRu3ZT5QZuUluM= roro@PAARDENKRACHT"
}
#Establish which Proxmox host you'd like to communicate with for the API
variable "proxmox_host" {
    default = "192.168.1.37"
}
#Establish which Proxmox node will run the VM
variable "proxmox_node" {
    default = "pve"
}
#Specify which template name you'd like to use
variable "template_name" {
    default = "ubuntu-2404-template"
}
#Establish which nic you would like to utilize
variable "nic_name" {
    default = "vmbr0"
}
#Establish the VLAN you'd like to use
variable "vlan_num" {
    default = "10"
}
#Provide the url of the host you would like the API to communicate on.
#It is safe to default to setting this as the URL for what you used
#as your `proxmox_host`, although they can be different
variable "api_url" {
    default = "https://192.168.1.37:8006/api2/json"
}
#Blank var for use by terraform.tfvars
variable "token_secret" {
}
#Blank var for use by terraform.tfvars
variable "token_id" {
}
