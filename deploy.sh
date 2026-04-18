#!/bin/bash
# deploy.sh

# Variables
PEM="ejercicio4.pem"
USER="ec2-user"
HOST="18.190.154.220"
DEST="/var/www/html"

# Copiar archivos al servidor (usa Estados.txt en lugar de data.txt)
scp -i $PEM Estados.txt script.py index.html $USER@$HOST:$DEST/

# Ejecutar el script en EC2 para regenerar resultado.txt
ssh -i $PEM $USER@$HOST "cd $DEST && python3 script.py"
