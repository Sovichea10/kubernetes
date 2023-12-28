#!/bin/bash

# Start
echo "Backup Starting..."

DATE=$(date +%d-%m-%Y-%H:%M:%S)
BACKUP_FILE="${PROJECT_NAME}_$DATE"
DOCKER_CONTAINER_NAME="${DOCKER_CONTAINER_NAME}"
DB_USER="${DB_USER}"
DB_PASSWORD="${DB_PASSWORD}"
DB_DATABASE="${DB_DATABASE}"

# Backup MySQL database - Dummy Bank
sudo docker exec -it ${DOCKER_CONTAINER_NAME} /usr/bin/mysqldump -u ${DB_USER} --password=${DB_PASSWORD} ${DB_DATABASE} > /tmp/${BACKUP_FILE}

# Archive as zip file
zip -r /tmp/${BACKUP_FILE}.zip /tmp/${BACKUP_FILE}.sql

# Remove file sql extension
rm -rf /tmp/${BACKUP_FILE}.sql

# End
echo "Backup Completed: ${BACKUP_FILE}.zip"