variable "vpc_id" {
  description = "보안그룹을 넣을 vpc의 id를 입력해주세요"
}
variable "name" {
  description = "보안 그룹 이름을 입력해주세요"
}
variable "from_port" {
}
variable "to_port" {}
variable "description" {
    description = "보안 그룹에 대한 설명을 입력해주세요"
}
variable "cidr_blocks" {
    description = "허용할 ip의 범위를 작성해주세요"
    default = ["0.0.0.0/0"]
}

variable "protocol" {
  description = "tcp 혹은 udp 둘 중 하나를 입력해주세요"
}



variable "alltag" {
  
}