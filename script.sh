echo "Installing Ansible"

# Update the package manager
sudo apt update

#Install ansible : 
sudo apt install ansible

echo "Ansible version"
#Check version of ansible core:
ansible --version

# echo "Ansible package version"
# #Check version of ansible package:
# python3 -m pip show ansible

#Adding a directory to PATH:
# export PATH="/home/milica/.local/bin:$PATH"

#Create the ansible configuration file in case you don't have it
#sudo mkdir /etc/ansible
#ansible-config init --disabled -t all > ansible.cfg
#sudo mv ansible.cfg /etc/ansible
