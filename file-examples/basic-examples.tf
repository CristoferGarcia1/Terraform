
## Ejemplo 1 de ficheros de configuración de Terraform

provider "aws" {
    alias  = "us-east-1"
    region = "us-east-1"
}

provider "aws" {
    alias  = "us-west-2"
    region = "us-west-2"
}


resource "aws_sns_topic" "topic-us-east" {
    provider = aws.us-east-1
    name     = "topic-us-east"
}

resource "aws_sns_topic" "topic-us-west" {
    provider = aws.us-west-2
    name     = "topic-us-west"
}

## Ejemplo 2 de un fichero de configuración:
  
provider "aws" {
    region = terraform.workspace == "default" ? "us-east-1" : "us-west-2"
}

#Get Linux AMI ID using SSM Parameter endpoint in us-east-1
data "aws_ssm_parameter" "linuxAmi" {
    name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

#Create and bootstrap EC2 in us-east-1
resource "aws_instance" "ec2-vm" {
    ami                         = data.aws_ssm_parameter.linuxAmi.value
    instance_type               = "t3.micro"
    associate_public_ip_address = true
    vpc_security_group_ids      = [aws_security_group.sg.id]
    subnet_id                   = aws_subnet.subnet.id
    tags = {
        Name = "${terraform.workspace}-ec2"
                # En el código que crea la máquina virtual EC2, hemos incrustado la variable en el atributo, por lo que podemos
                # distinguir fácilmente esos recursos cuando se crean dentro de sus respectivos espacios de trabajo por su nombre:
                # $terraform.workspaceName<workspace name>-ec2
    }
}
