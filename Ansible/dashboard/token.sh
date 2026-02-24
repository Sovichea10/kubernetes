#!/bin/bash

USER="admin-user"

kubectl create -n kubernetes-dashboard token "$USER" --duration=72h -o=yaml > token-$USER.yaml
