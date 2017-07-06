#!/bin/bash
KEY=/tmp/nginx.key
CERT=/tmp/nginx.crt
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $KEY -out $CERT -subj "/CN=nginxsvc/O=nginxsvc"
kubectl create secret generic nginxsecret --from-file=nginx.key=$KEY --from-file=nginx.crt=$CERT
kubectl create configmap nginxconfigmap --from-file=default.conf
kubectl create -f nginx-app.yaml
