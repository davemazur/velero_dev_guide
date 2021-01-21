# install the velero server using min.io as the local object store
#
# instructions for installing and starting up the minio server
# % brew install minio/stable/minio
# % export MINIO_ACCESS_KEY=minio
# % export MINIO_SECRET_KEY=miniostorage
# % minio server <local directory to use as the bucket/object store>
# note:  when the minio server starts up, insert the url below...

# setting up velero
export MINIOURL=<plugin your min.io url here>:9000
export BUCKET=velero-lab
export REGION=minio,s3ForcePathStyle="true",s3Url=$MINIOURL
export SECRETFILE=credentials-minio
export PREFIX=velero-lab-backup

# ----
# install velero latest
# ----

export IMAGE=velero/velero:latest

echo ""
echo "INFO: Installing velero server"  

velero install \
  --provider aws \
  --plugins velero/velero-plugin-for-aws:v1.0.0 \
  --use-volume-snapshots=false \
  --bucket $BUCKET \
  --prefix $PREFIX \
  --backup-location-config region=$REGION \
  --secret-file $SECRETFILE \
  --image $IMAGE