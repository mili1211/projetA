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
<img src="/images/schema_d'archi.png">
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
- Git version 2.34.1: Utilisé pour lq gestion de mon repo GitHub



