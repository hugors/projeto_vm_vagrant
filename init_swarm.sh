#!/bin/bash
if [ "$(hostname)" = "master" ]; then
  echo "[INFO] Inicializando Docker Swarm no master..."
  docker swarm init --advertise-addr 192.168.56.10

  TOKEN=$(docker swarm join-token -q worker)
  echo $TOKEN > /vagrant/scripts/worker_token.txt
  echo "[INFO] Token salvo em /vagrant/scripts/worker_token.txt"
fi
