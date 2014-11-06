vagrant-swbpdemo
================

Provee una máquina virtual con una instancia de ubuntu trusty de 64 bits. En esta instancia se despliega SWB Process sobre apache tomcat 7 para hacer pruebas o demos. La configuración de SWBProcess es la de defecto.

##Dependencias
* [Vagrant](https://www.vagrantup.com/)
* [Virtualbox](https://www.virtualbox.org/)

##Instalación
````
vagrant up
````

##Inicio del servidor de aplicaciones
````
vagrant ssh
cd /opt/apache-tomcat/bin
sudo sh catalina.sh start
````

##Paro del servidor de aplicaciones
````
vagrant ssh
cd /opt/apache-tomcat/bin
sudo sh catalina.sh stop
````

##(Re)aprovisionamiento
````
vagrant provision
````