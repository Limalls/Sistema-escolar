#!/bin/bash
# start.sh — Inicia o JSON Server e o Vite em paralelo
# Uso: ./start.sh

# Garante que as dependências estão instaladas
if [ ! -d "node_modules" ]; then
  echo "Instalando dependências..."
  npm install
fi

# Encerra os dois processos ao sair (Ctrl+C)
trap 'echo ""; echo "Encerrando..."; kill $(jobs -p) 2>/dev/null; exit' INT TERM

echo "Iniciando JSON Server em http://localhost:3000 ..."
npx json-server --watch db.json --port 3000 &

echo "Iniciando Vite (React) em http://localhost:5173 ..."
npm run dev &

# Aguarda os dois processos em segundo plano
wait
