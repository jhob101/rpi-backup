#re-create a backup directory
rm -rf ./backup
mkdir ./backup

#copy a package list
dpkg --get-selections > ./backup/Package.list
sudo cp -R /etc/apt/sources.list* ./backup/
sudo apt-key exportall > ./backup/Repo.keys

#compress directories
tar -czf ./backup.tar.gz /home /etc /usr/local/etc ./backup
#tar -czf ./backup.tar.gz ./backup

#send to the cloud
rclone copyto --config="/home/pi/.config/rclone/rclone.conf" ./backup.tar.gz g-drive:/weatherstation/backup.tar.gz

#delete old backups
sudo rclone delete g-drive:/weatherstation/ --min-age 7d
#delete the temporary directory
rm -rf ./backup
rm -f ./backup.tar.gz