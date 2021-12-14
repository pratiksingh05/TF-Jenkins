FILE=jdk-8u301-linux-x64.tar.gz

ROOT=jdk1.8.0_301

VERSION=301-b09

HASH=d3c52aa6bfa54d3ca74e617f18309292

URL="https://javadl.oracle.com/webapps/download/GetFile/1.8.0_$VERSION/$HASH/linux-i586/$FILE"

wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" $URL



chmod +x



# Decompress package into /opt/java

if [ ! -d "/opt/java" ]; then

    mkdir /opt/java

fi



tar zxvf $FILE -C /opt/java



# Update path references in system profile and make it default

echo 'export JAVA_HOME=/opt/java/'$ROOT > /etc/profile.d/jdk.sh

echo 'export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin' >> /etc/profile.d/jdk.sh

chmod +x /etc/profile.d/jdk.sh

sudo update-alternatives --install "/usr/bin/java" "java" "/opt/java/$ROOT/bin/java" 1

sudo update-alternatives --install "/usr/bin/javac" "javac" "/opt/java/$ROOT/bin/javac" 1

sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/java/$ROOT/bin/javaws" 1

sudo update-alternatives --set java /opt/java/$ROOT/bin/java

sudo update-alternatives --set javac /opt/java/$ROOT/bin/javac

sudo update-alternatives --set javaws /opt/java/$ROOT/bin/javaws

# Reload system profile

. /etc/profile

java -version
