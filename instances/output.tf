output "client1__public_ip"{
 value = module.client1.*.public_ip
}
output "client2__public_ip"{
 value = module.client2.*.public_ip
}
