# Docker Swarm Cluster com Vagrant

## 🧩 Estrutura
- master (192.168.56.10): nó manager
- node01, node02, node03: nós workers

## 🚀 Como usar

```bash
vagrant up
vagrant ssh master
docker swarm init --advertise-addr 192.168.56.10
exit
vagrant ssh node01 -c "bash /vagrant/scripts/join_worker.sh"
vagrant ssh node02 -c "bash /vagrant/scripts/join_worker.sh"
vagrant ssh node03 -c "bash /vagrant/scripts/join_worker.sh"
vagrant ssh master
docker node ls
```

## 📦 Requisitos
- VirtualBox
- Vagrant

## 🧑‍💻 Autor
Desenvolvido por **Hugo Rosa**
