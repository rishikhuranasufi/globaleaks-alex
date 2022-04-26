data "terraform_remote_state" "network_details" {
  backend = "s3"
  config = {
  bucket = "globaleaks-project-bucket"
  key = "globaleaks-network-state"
  region = var.region
 }
}
module "client1" {
 source = "./modules/linux_node"
 ami = "ami-029fa1c105b8cc9e1"
 instance_type = "t3.micro"
 instance_count = "1"
 subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
 key_name = data.terraform_remote_state.network_details.outputs.SSH_Key
 vpc_security_group_ids = data.terraform_remote_state.network_details.outputs.security_group_id_array
tags = {
    Name = var.webserver_prefix
        }
 }

module "client2" {
 source = "./modules/linux_node"
 ami = "ami-029fa1c105b8cc9e1"
 instance_type = "t3.micro"
 instance_count = "1"
 subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
 key_name = data.terraform_remote_state.network_details.outputs.SSH_Key
 vpc_security_group_ids = data.terraform_remote_state.network_details.outputs.security_group_id_array
tags = {
    Name = var.webserver_prefix
        }
 }
