docker network create orthanc;
docker run --restart=always --network=orthanc --name orthanc -itd -p 4242:4242 -p 8042:8042 jodogne/orthanc:1.5.8
docker run --restart=always --network=orthanc --name meddream -itd -p 8081:80 -e integration=token \
  -v $PWD/config/application.properties:/opt/meddream/application.properties:ro \
  -v $PWD/config/system.json:/opt/meddream/sys/settings/system.json:ro \
  -v $PWD/config/meddream.lic:/opt/meddream/license/meddream.lic \
  meddream/orthanc-dicom-viewer
docker run --restart=always --network=orthanc --name meddream-token-service -itd -p 8088 meddream/token-service
docker run --restart=always --network=orthanc -d -p 8080:80 --name his meddream/dicom-viewer-integration
docker run --rm --network=orthanc dcm4che/dcm4che-tools:5.16.3 storescu -cDCM4CHEE@orthanc:4242 /opt/dcm4che/etc/testdata/dicom

