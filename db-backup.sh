# To run this script needs the b2 python library
# pip install --upgrade b2
# You must also add your authorization
# b2 authorize-account <applicationKeyID> <applicationKey>

# Your dokku mongo instance name
SERVICE='mongo-db'

BACKUPNAME=`date +"${SERVICE}--%Y-%m-%d--%H:%M:%S.dump.gz"`

echo Backing up ${SERVICE} to ${BACKUPNAME}

dokku mongo:export ${SERVICE} > ${BACKUPNAME}

echo ${SERVICE} has been exported.

# Your BackBlaze bucket name
BUCKETNAME='bucket-name'

echo "b2 upload-file ${BUCKETNAME} ${BACKUPNAME} ${BACKUPNAME}"

b2 upload-file ${BUCKETNAME} ${BACKUPNAME} ${BACKUPNAME}

rm ${BACKUPNAME}
