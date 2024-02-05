https://github.com/haidaraM/ansible-playbook-grapher
sudo dnf install graphviz python3.11 python3.11-pip -y
python3.11 -m pip install ansible-navigator --user
python3.11 -m pip install ansible-playbook-grapher --user
ansible-playbook-grapher playbook.yaml