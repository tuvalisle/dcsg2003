#!/bin/bash

# Konfigurasjon
OUTPUT_DIR="~/backup"
BACKUP_FILE="backup_$(date +%Y-%m-%d).tar.gz"
BACKUP_SERVER="ubuntu@192.168.129.22"
REMOTE_DIR="/mnt/backups"

# Lag backup
python3 ./bookface/tools/backup_db.py --output-dir "$OUTPUT_DIR"

# Komprimer backup
BACKUP_PATH="$OUTPUT_DIR/$BACKUP_FILE"
tar -czf "$BACKUP_PATH" -C "$OUTPUT_DIR" .

# Send til backup-server
scp "$BACKUP_PATH" "$BACKUP_SERVER:$REMOTE_DIR"

# Slett lokal backup for å spare plass
rm -rf "$OUTPUT_DIR"/*

echo "Backup fullført og overført til $BACKUP_SERVER:$REMOTE_DIR"
