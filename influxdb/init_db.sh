# Star luxdb
/usr/sbin/influxd & sleep 3

mkdir -p /var/lib/influxdb/data
mkdir -p /var/lib/influxdb/wal
mkdir -p /var/lib/influxdb/meta
#Initialize database
influx -execute "CREATE DATABASE grafana"
influx -execute "CREATE USER cmarteau WITH PASSWORD 'yo'"
influx -execute "GRANT ALL ON grafana TO cmarteau"


# Keep container running
tail -f /dev/null
