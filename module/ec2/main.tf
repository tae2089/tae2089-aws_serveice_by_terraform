resource "aws_instance" "ec2" {

    ami = "${var.ami_code}"
    instance_type = "${var.instance_type}"
    
    #Vpc
    subnet_id = "${var.vpc_subnet_id}"
    
    #Security설정하기
    #Volume
    root_block_device {
        volume_size = "${var.volume_size}"
    }
    #Key 설정하기 
    # Key세팅 방법은 두가지 - 
    # key_name = "" #pem파일에 경우 key_name까지만 작성 그게 아닐 경우 public_key도 작성
    #public_key = file("~/.ssh/id_rsa.pub")  ssh-keygen을 통한방법
 
    #provisioning하는 내용추가
    #
}