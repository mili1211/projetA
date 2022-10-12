# Update the package manager
sudo apt-get update
#Install all relevant dependencies on which Ansible will rely on to install correctly: 
sudo apt-get install python3 python3-pip git libffi-dev libssl-dev -y 
#Install ansible : 
python3 -m pip install --user ansible
#Check version of ansible core:
ansible --version
#Check version of ansible package:
python3 -m pip show ansible
#Adding a directory to PATH:
export PATH="/home/milica/.local/bin:$PATH"
#Create the ansible configuration file
sudo mkdir /etc/ansible
ansible-config init --disabled -t all > ansible.cfg
sudo mv ansible.cfg /etc/ansible
