resource "aws_key_pair" "vm_ssh_key" {
    key_name = "globaleaks-vm-key"
    public_key = file("../keys/globaleaks-vm-key.pub")
}
