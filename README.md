# mysql
mysql docker image

Docker file requires mysql tar file in the folder. 

Run the container with username and password environment variables. It creates a mysql user and logs in with the mysql user details. 

Docker run --name=mysql -e username="username" -e password="password" <image-id>

Creates a username and password and logs in with the same. 
