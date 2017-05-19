rm -rf /usr/local/presto
cd /opt/
prestoDir="prestoDir"
mkdir -p $prestoDir
tar xvfz presto-server-0.170.tar.gz -C $prestoDir
cd $prestoDir
mv presto* /usr/local/presto
cd /usr/local/presto
mkdir etc
cd etc
touch node.properties
echo -e "node.environment=production\nnode.id=ffffffff-ffff-ffff-ffff-ffffffffffff\nnode.data-dir=/var/presto/data">node.properties
touch jvm.config
echo -e "-server\n-Xmx16G\n-XX:+UseG1GC\n-XX:G1HeapRegionSize=32M\n-XX:+UseGCOverheadLimit\n-XX:+ExplicitGCInvokesConcurrent\n-XX:+HeapDumpOnOutOfMemoryError\n-XX:+ExitOnOutOfMemoryError">jvm.config
touch config.properties
ip_address="$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"
port="8081"
echo -e "coordinator=true\nnode-scheduler.include-coordinator=true\r\nhttp-server.http.port=$port\nquery.max-memory=5GB\nquery.max-memory-per-node=3GB\ndiscovery-server.enabled=true\ndiscovery.uri=http://$ip_address:$port">config.properties
touch log.properties
echo -e "com.facebook.presto=INFO">log.properties
mkdir catalog
cd catalog
touch hive.properties
echo -e "connector.name=hive-hadoop2\r\nhive.metastore.uri=thrift://$ip_address:9083">hive.properties
cd /usr/local/presto/bin
./launcher run


