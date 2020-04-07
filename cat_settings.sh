mkdir config
docker run --rm --entrypoint=cat meddream/orthanc-dicom-viewer /opt/meddream/application.properties > ./config/application.properties
docker run --rm --entrypoint=cat meddream/orthanc-dicom-viewer /opt/meddream/sys/settings/system.json > ./config/system.json
echo "Settings overwrited"
