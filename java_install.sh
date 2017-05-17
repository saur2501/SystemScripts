rm -rf /usr/local/java
cd /opt/
dir="jdkDirectory"
mkdir -p $dir
tar xvzf jdk*.tar.gz -C $dir
mv $dir/jdk* /usr/local/java
echo -e '\nexport JAVA_HOME=/usr/local/java'>>~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH'>>~/.bashrc
source ~/.bashrc

