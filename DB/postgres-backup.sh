#!/bin/bash

# Start
echo "Backup Starting..."

DATE=$(date +%d-%m-%Y-%H:%M:%S)
BACKUP_FILE="${PROJECT_NAME}_$DATE"
DOCKER_CONTAINER_NAME="${DOCKER_CONTAINER_NAME}"
POSTGRES_USER="${POSTGRES_USER}"

# Backup POSTGRES database - English Dictionary API
sudo docker exec -it ${DOCKER_CONTAINER_NAME} pg_dumpall -c -U ${POSTGRES_USER} > /tmp/${BACKUP_FILE}.sql

# Archive as zip file
zip -r /tmp/${BACKUP_FILE}.zip /tmp/${BACKUP_FILE}.sql

# Remove file sql extension
rm -rf /tmp/${BACKUP_FILE}.sql

# End
echo "Backup Completed: ${BACKUP_FILE}.zip"