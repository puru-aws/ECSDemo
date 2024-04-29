# Demonstrating how EFS acts as a persistant data store. 

- Create a EFS file system using [Official Doc](https://docs.aws.amazon.com/efs/latest/ug/gs-step-two-create-efs-resources.html)

- Launch an Amazon Linux EC2 instance in a public subnet [Doc](https://www.cloud-plusplus.com/post/aws-ec2-linux-instance)


- Install amazon-efs-utils and apache server

```
sudo yum install -y amazon-efs-utils,httpd
sudo service httpd start
```

- After the utility installation are complete, make a directory for the mount point on Apache web server using the following command:

```
sudo mkdir /var/www/html/efs-new-mp
```

- Run the next command to change directory to the html.

```
cd /var/www/html
```

- Mount the file system to the directory created in the above step using the following command. Ensure that you replace the files system id that is marked blue in the below command with your own EFS ID:

```
sudo mount -t efs <efs file system ID>:/ efs-new-mp
```

- Change the directory to the mount point that is created above using the command:

```
cd efs-new-mp
```

- Create a new sub directory with following command:

```
sudo mkdir webappdir
```

- Change the permissions of the above subdirectory with the following command:

```
sudo chown ec2-user webappdir
```

- Change the directory to webappdir directory with following command:

```
cd webappdir
```

- We load an HTML file into this directory:

```
sudo su 
echo "<html><h1>Hello from your EFS</h1></html>" > hello.html
```
- To check, copy the DNS name of your instance

```
<DNS name>/efs-new-mp/webappdir/hello.html
```

- Now proceed to create one more Linux instance in a different subnet (AZ) than the first one. 

- Add the below commands to its userdata 

```
#!/bin/bash
sudo yum install -y amazon-efs-utils 
sudo yum install -y httpd
sudo service httpd start
sudo mkdir /var/www/html/efs-new-mp
cd /var/www/html
sudo mount -t efs <efs file system ID>:/ efs-new-mp
```

- check if the new server also has the same content 
