sudo yum install -y amazon-efs-utils 
sudo yum install -y httpd
sudo service httpd start
sudo mkdir /var/www/html/efs-new-mp
cd /var/www/html
sudo mount -t efs fs-026cee9c20cfa426f:/ efs-new-mp
cd efs-new-mp
sudo mkdir webappdir
sudo chown ec2-user webappdir
sudo su 
sudo echo "<html><h1>Hello from your EFS</h1></html>" > hello.html