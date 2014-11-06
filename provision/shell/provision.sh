PUPPET_MODULES_PATH="/etc/puppet/modules"

dpkg -s oracle-java7-installer > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
	echo "Installing Oracle JDK..." \
	&& add-apt-repository ppa:webupd8team/java > /dev/null 2>&1 \
	&& apt-get update > /dev/null 2>&1 \
	&& echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections \
	&& echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections \
	&& apt-get install -y oracle-java7-installer
fi

if [ ! -f "$PUPPET_MODULES_PATH" ]; then
	mkdir -p "$PUPPET_MODULES_PATH"
fi

if [ ! -d "$PUPPET_MODULES_PATH"/tomcat ]; then
	echo "Installing tomcat module for puppet"
	puppet module install puppetlabs/tomcat
fi