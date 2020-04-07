docker exec -it meddream \
       cat  /opt/meddream/application.properties > ./config/application.properties
docker exec -it meddream \
       cat /opt/meddream/sys/settings/system.json > ./config/system.json
docker exec -it meddream \
       cat /opt/meddream/license/meddream.lic > ./config/meddream.lic

