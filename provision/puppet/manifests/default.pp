#URL de la distribución deseada de tomcat 7
$tomcat_dist_url='http://apache.osuosl.org/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz'
#URL de la distribución de SWBProcess deseada
$swbp_dist_url='http://www.semanticwebbuilder.org.mx/es_mx/swb/SWB_Process/_rid/1146/_mto/3/_act/download/doc/swbp.war'
#Identificador de la instancia instalada
$instance_name='tomcat7'

class { 'tomcat': }

tomcat::instance { $instance_name:
  	source_url => $tomcat_dist_url,
}->
tomcat::war { 'ROOT.war':
	war_source => $swbp_dist_url,
}->
exec {'clean_up':
	command => 'rm -Rf /opt/apache-tomcat/webapps/ROOT/',
	path => "/bin/:/sbin/:/usr/bin/:/usr/sbin/",
	user => root,
}