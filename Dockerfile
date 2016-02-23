FROM ubuntu:latest

COPY mysql-5.5.48-linux2.6-x86_64.tar.gz /tmp/mysql-5.5.48-linux2.6-x86_64.tar.gz

RUN groupadd mysql
RUN useradd -r -g mysql -s /bin/false mysql
RUN tar zxvf /tmp/mysql-5.5.48-linux2.6-x86_64.tar.gz -C /usr/local/
RUN mv /usr/local/mysql-5.5.48-linux2.6-x86_64 /usr/local/mysql
RUN chown -R mysql:mysql /usr/local/mysql 
RUN apt-get install libaio1 libaio-dev
RUN cd /usr/local/mysql; scripts/mysql_install_db --user=mysql
RUN chown -R root /usr/local/mysql 
RUN chown -R mysql /usr/local/mysql/data

COPY run.sh /tmp/run.sh
EXPOSE 3306
CMD bash -C '/tmp/run.sh' 
