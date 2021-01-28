# installing the velero server using aws as the object store
export BUCKET=velero-tamlab
export REGION=us-east-2
export SECRETFILE=/Users/dmazur/.aws/credentials
export PREFIX=tamlab-backup

# ----
# install velero latest
# ----

export IMAGE=velero/velero:latest

echo ""
echo "INFO: Installing velero server"  

velero install \
  --provider aws \
  --plugins velero/velero-plugin-for-aws:v1.0.0 \
  --bucket $BUCKET \
  --prefix $PREFIX \
  --backup-location-config region=$REGION \
  --snapshot-location-config region=$REGION \
  --secret-file $SECRETFILE \
  --image $IMAGE