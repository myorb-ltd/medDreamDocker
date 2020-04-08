# medDreamDocker
First at all you need to start docker as a service.
## Remove containers
```bash
./rm.sh
```

## Stop containers
```bash
./stop.sh
```

## Start containers
```bash
./start.sh
```
## Original Settings
To orverwrite the config files.
```bash
./cat_settings.sh
```
Edit the config/application.properties file and add the following line
```java
authentication.his.token-service-address=http://meddream-token-service:8088/v1/validate
```
## Change the settings
Edit the files in the config/ directory. ./stop.sh ./rm.sh and ./start.sh again.
```
Then change the files and start again.

