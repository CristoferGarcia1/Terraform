## Una vez desplegado, si lo queremos escalar:

Con el siguiente comando podemos ver el estado del deployment:
  - cmd: terraform state list show kubernetes_deployment.tf-k8s-deployment | grep replicas

Vemos que tiene 2 replicas, lo que le indicamos en nuestro archivo main.tf.

+ Modificamos el archivo main.tf y añadimos 4 replicas en lugar de 2:
  - cmd: vim main.tf

+ El comando terraform plan crea un plan de ejecución, que le permite obtener una vista previa de los cambios que Terraform planea realizar en su infraestructura.
   - cmd: terraform plan

+ A continuacion aplicamos los cambios:
   - cmd: terraform apply

Ahora podemos comprobar el estado de nuestra infraestructura de nuevo y vemos que ahora tenemos 4
   - kubectl get pods 