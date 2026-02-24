#!/bin/bash

IPADDR=$(curl ifconfig.me && echo "")
NODENAME=$(hostname -s)
POD_CIDR="192.168.0.0/16"

sudo kubeadm init --control-plane-endpoint=$IPADDR --apiserver-cert-extra-sans=$IPADDR --pod-network-cidr=$POD_CIDR --node-name=$NODENAME --ignore-preflight-errors=all

