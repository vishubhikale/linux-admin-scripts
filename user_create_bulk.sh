#!/bin/bash
# Bulk user creation - L2 admin task for onboarding L1/L2 support team members
# Author: Vishwajit Bhikale
# Input file format: username,department (users.csv)
INPUT="users.csv"
if [ ! -f $INPUT ]; then
  echo "Error: $INPUT not found. Create file with username,dept per line"
  exit 1
fi
while IFS=, read -r username dept; do
  # Skip empty lines
  if [ -z "$username" ]; then continue; fi
  echo "Creating user: $username for dept: $dept"
  sudo useradd -m $username -G $dept
  echo "$username:Temp@123" | sudo chpasswd
  sudo chage -d 0 $username
  echo "User $username created with temp password"
done < $INPUT
echo "Bulk user creation completed at $(date)"
