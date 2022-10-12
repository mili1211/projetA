# Projet A - Formation DevOps Factory 
## Contexte
Mise en pratique des modules vus dans le cadre de la formation.
## Sujet 
### Industrialisation des gests 
Automatisation d'une simple application qui se compose d'un serveur web (PHP) et une API (Flask) et qui a pour but d'afficher une liste d'étudiants.
## Objectives
L'objectif de ce projet est d'apprendre comment automatiser le déploiement d'une application a l'aide d'Ansible et en utilisant des containers Dockers.
## Organisation du travail 
- Installation manuelle et redaction de la documentation
  - Durée : 2 jours 
  - Outils : PHP, Python, Docker, Git 
- Integration des outils
  - Durée : 1 jour 
  - Outils : VMware, Linux, VSCode, Git 
- Automatisation avec Ansible
  - Durée : 4 jours 
  - Outils : Ansible
- Documentation du projet
  - Durée : 1 jours 
  - Outils : GitHub, MarkDown  
## Schéma d'architecture 
<img src="/images/schema_d'architecture.png">

## Environnement technique
Mon environnement est constitué de deux machines virtueles:
- control node: Ansible
- managed node: Docker

### Caractéristiques techniques des machines virtuels:
- Supervisor: 
  - VMware® Workstation 16 Pro version 16.2.4
- OS: Ubuntu 22.04.1 LTS  
- Kernel: Linux 5.15.0-48-generic
- CPU cores: 2
- RAM : 3889 MB

### Middleware et services
- Ansible version 2.13.4: Installé sur le control node
- Docker version 20.10.18: Installé sur le managed node
- GitHub: Gestionnare de code source

### Stack applicative 
- Python version 3.10.6: Installé sur les deux machines car Ansible se base sur de s appels Python pour son fonctionnement
- Git version 2.34.1: Utilisé pour la gestion de mon repo GitHub

## Étapes pour créer l'application

<ol>
<li>Ansible installation et configuration: script.sh</li>
<li>Installation du serveur openssh, génération de la clé et connexion à managed node</li>
  
<table><tr><td>
sudo apt install openssh-server
</td></tr></table>
<table><tr><td>
ssh-keygen -t rsa
</td></tr></table>
<table><tr><td>
sudo ssh-copy-id username@ip_machine_managed_node
</td></tr></table>
 <table><tr><td>
ssh 'username@ip_machine_managed_node'
</td></tr></table>
  
<li>Cloner le dépôt github pour l'application Flask</li>
<table><tr><td>
git clone https://github.com/ulrichmonji/student-list.git
</td></tr></table>
  
<li>Installer Docker pour ton OS</li>
<li>Ecrire le Dockerfile</li>
  
```
FROM python:2.7-stretch
LABEL maintainer=milica.djajic@hotmail.com
COPY . /
VOLUME /data
RUN apt-get update -y && apt-get install python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev -y
RUN pip install flask==1.1.2 flask_httpauth==4.1.0 flask_simpleldap python-dotenv==0.14.0
EXPOSE 5000
CMD [ "python", "./student_age.py" ]
```
  
<li>Builder l'image docker, création du réseau docker et lancement de conteneurs.</li>
  
 ```
 # builder l'image qui sappelera student-list:latest
docker build -t student-list .

# creation du réseau privé des containers
docker network create projeta

# lancement de l'api
docker run --name api-projet-a -d -p 5000:5000  --network projeta -v $PWD/student_age.json:/data/student_age.json student-list:latest

# lancement de website
docker run -d --name ihm-projet-a --network projeta -e USERNAME=toto -e PASSWORD=python -p 80:80 -v $PWD/../website:/var/www/html   php:apache
 ```
  <li> Modifier la ligne suivante dans le fichier index.php: $url = 'http://api-projet-a:5000/pozos/api/v1.0/get_student_ages' </li> </li>
  <li> Tester l'application sur https://localhost:80 </li>
  <li> Creation de fichier hosts.yml et dosiers host_vars et group_vars ainsi que de dossier files et son contenu </li>
  <li> Creation de playbooks: git, docker, frontend and backend</li>
  <li> Creation de roles et répartition des taches</li>
  <li>Création et exécution de playbook principale</li>
   <li>Tester l'application sur managed node</li>
  
</ol>

### Points d'amélioration
<ul>
<li>Automatisation de tache "tester l'application" via module get_url </li>
<li>Installation de pare-feu</li>
<li>Installation et mise en place du Vagrant</li>
<li>Meilleure gestion du code sur GitHub</li>
</ul>





 



