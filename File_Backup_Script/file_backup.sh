#!/bin/bash

# === CONFIGURATION ===
SOURCE_DIR="/home/skull-_-beardx29/GitHub_Repos/CronJobs_BashScripts/Source_file.txt"      # Directory you want to back up
BACKUP_DIR="/home/skull-_-beardx29/GitHub_Repos/CronJobs_BashScripts/Data_Backup_Dir"                   # Where to store the backups
TIMESTAMP=$(date +%F-%H-%M)                # e.g., 2025-01-01-14-30
BACKUP_NAME="data-backup-$TIMESTAMP.tar.gz"  # Backup filename

# === CREATE BACKUP ===
touch "$SOURCE_DIR"
echo "Text I want to Backup in the file." > "$SOURCE_DIR"
mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"

# === CLEANUP OLD BACKUPS (older than 7 days) ===
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete

echo "Backup completed: $BACKUP_DIR/$BACKUP_NAME"
