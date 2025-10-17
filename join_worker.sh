#!/bin/bash
MASTER_IP="192.168.56.10"
TOKEN_FILE="/vagrant/scripts/worker_token.txt"

if [ "$(hostname)" != "master" ]; then
  if [ -f "$TOKEN_FILE" ]; then
    TOKEN=$(cat $TOKEN_FILE)
    echo "[INFO] Entrando no cluster Swarm..."
    docker swarm join --token $TOKEN $MASTER_IP:2377
  else
    echo "[ERRO] Token não encontrado. Execute primeiro o master."
  fi
fi
