#!/bin/bash

# Source file
src_file="/home/mlg/prs_assignment/Personal_Record_System"

# Destination file
dst_file="/home/mlg/prs_assignment/backup_disk"

# command to backup
rsync -av $src_file $dst_file
