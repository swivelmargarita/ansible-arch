# Turbo Ansible Arch

Turbo Ansible Arch is an ansible playbook for configuring your fresh Arch Linux post-install. 
## Usage

Clone the [repository](https://gitlab.com/turbo-zone/ansible-arch/) and execute the playlist. 
Comment out or delete unneeded roles from the [main.yaml](https://gitlab.com/turbo-zone/ansible-arch/-/blob/master/main.yaml)

```bash
git clone https://gitlab.com/turbo-zone/ansible-arch/
cd ansible-arch
ansible-playbook --ask-become-pass main.yaml 
```