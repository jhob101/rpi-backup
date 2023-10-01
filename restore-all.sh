#unpack all data
tar -xvf backup.tar.gz /

#restore list of packages
sudo apt-key add /backup/Repo.keys 
sudo cp -R /backup/sources.list* /etc/apt/ 
sudo apt-get update 
sudo apt-get install dselect 
sudo dselect update 
sudo dpkg --set-selections < /backup/Package.list 
sudo apt-get dselect-upgrade -y
