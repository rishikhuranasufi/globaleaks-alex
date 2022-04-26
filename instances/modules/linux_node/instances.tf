resource "aws_instance" "my_vm"{
  count = var.instance_count
  ami = "ami-029fa1c105b8cc9e1"
  instance_type = "t3.micro"
  subnet_id = var.subnet_id
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
tags = var.tags

provisioner "remote-exec" {
connection {
        host = self.public_ip
        type = "ssh"
        user = "ubuntu"
        agent = false
        private_key = file("../keys/globaleaks-vm-key")
      }
     inline = ["sudo apt-get update -y",
       "sudo apt install docker.io -y",
       "sudo usermod -aG docker $USER",
       "sudo docker pull ashisharintech/globaleaks:bale",
       "sudo docker run -d -p 80:80 ashisharintech/globaleaks:bale"
         ]
     }
}
