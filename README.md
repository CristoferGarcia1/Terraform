# Terraform

## Instalación terraform en Red Hat 8
```
sudo yum install -y yum-utils
sudo yum update
sudo yum-config-manager --add-repo https://rpm.release.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```
 #### Habilitar log detallado para los comandos terraform
```
export TF_LOG=TRACE
```