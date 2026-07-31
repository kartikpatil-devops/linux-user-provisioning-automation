#!/bin/bash

CSV_FILE="input/users.csv"
LOG_FILE="logs/provisioning.log"
BASE_DIR="/shared"

mkdir -p logs
mkdir -p "$BASE_DIR"

echo "==========================================" >> "$LOG_FILE"
echo "User Provisioning Started: $(date)" >> "$LOG_FILE"
echo "==========================================" >> "$LOG_FILE"

tail -n +2 "$CSV_FILE" | while IFS=',' read -r USERNAME DEPARTMENT
do
    if id "$USERNAME" &>/dev/null; then
        echo "[INFO] User $USERNAME already exists." | tee -a "$LOG_FILE"
    else
        useradd -m "$USERNAME"
        echo "[SUCCESS] User $USERNAME created." | tee -a "$LOG_FILE"
    fi

    if getent group "$DEPARTMENT" > /dev/null; then
        echo "[INFO] Group $DEPARTMENT already exists." | tee -a "$LOG_FILE"
    else
        groupadd "$DEPARTMENT"
        echo "[SUCCESS] Group $DEPARTMENT created." | tee -a "$LOG_FILE"
    fi

    usermod -aG "$DEPARTMENT" "$USERNAME"

    mkdir -p "$BASE_DIR/$DEPARTMENT"

    chown root:"$DEPARTMENT" "$BASE_DIR/$DEPARTMENT"

    chmod 770 "$BASE_DIR/$DEPARTMENT"

    echo "[SUCCESS] $USERNAME added to $DEPARTMENT group." | tee -a "$LOG_FILE"
    echo "[SUCCESS] Directory $BASE_DIR/$DEPARTMENT configured." | tee -a "$LOG_FILE"
    echo "----------------------------------------" >> "$LOG_FILE"

done

echo "Provisioning Completed Successfully." | tee -a "$LOG_FILE"
