#!/bin/bash
# deploy.sh


PEM="ejercicio4.pem"
USER="ec2-user"
HOST="18.190.154.220"
DEST="/var/www/html"


scp -i $PEM Estados.txt script.py index.html $USER@$HOST:$DEST/


ssh -i $PEM $USER@$HOST "cd $DEST && python3 script.py"
