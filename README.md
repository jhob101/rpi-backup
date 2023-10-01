# Backup important folders from a Raspberry Pi to Google Drive

## Installation

### Install `rclone`
There's some set up that needs doing with `rclone` and Google Drive, but I forget exactly what.  Think it might be something like this:

https://rclone.org/drive/

Note that you'll need to change the GDrive backup folder to whatever you want in the script.

## Setup a backup schedule
Install as a root cron job with

`sudo crontab -e`

and add the following line to the end to run the backup job daily:

`30 01 * * * bash /home/pi/rpi-backup/backup-all.sh`

## Restoring from backup
Download the latest backup from Google Drive to `~/`

then

`sudo ./restore-all.sh`