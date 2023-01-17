## Play with terraform

1. Téléchargez et installez le client Terraform sur votre ordinateur.
2. Créez un compte AWS (ou bien utiliser votre compte AWS Academy) et configurez vos clés d'accès dans Terraform.
3. Cré ez un fichier de configuration Terraform pour dé ployer un bucket S3 (ce bucket doit être exclusivement accessible par l'instance EC2).
4. Utilisez la commande Terraform init pour initialiser le répertoire de travail.
5. Utilisez la commande Terraform plan pour visualiser les modifications qui seront apportées à AWS.
6. Utilisez la commande Terraform apply pour appliquer les modifications et déployer le bucket S3.
7. Testez le fonctionnement du bucket S3 en y téléchargeant et en y accédant à un fichier.
8. Créez un autre fichier de configuration Terraform pour déployer un groupe de sécurité , un VPC et un serveur EC2 .
9. Utilisez la commande Terraform plan pour visualiser les modifications qui seront apportées à AWS.
10. Utilisez la commande Terraform apply pour appliquer les modifications et déployer le groupe de sécurité et le serveur EC2.
11. Testez le fonctionnement du serveur EC2 en y accédant à l'aide d'un client SSH.
PS: Vous devez réorganiser le TP pour comprendre le fonctionnement de chaque ressource.
BONUS : Utilisation de modules terraform dans le code.
MALUS : Absence de variables
TIPS : Faites le TP sur la console AWS avant d'écrire le code terraform.