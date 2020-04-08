# to get the ip address:
# docker inspect --format '{{ .NetworkSettings.Networks.orthanc.IPAddress }}' meddream-token-service
curl -X POST -H "Content-Type: application/json" -d @./test.json http://172.21.0.4:8088/v1/generate


