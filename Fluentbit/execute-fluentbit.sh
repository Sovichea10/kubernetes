#!/bin/bash

LINE="===================================="

mysource=(
    "FLUENTD" "ELASTICSEARCH" "KIBANA"
)

# Assign Argument
SOURCE=$1

if [ -z "$SOURCE" ]; then
    echo -e "$LINE\n${mysource[@]}\n$LINE"

elif [[ ! "${mysource[@]}" == *"$SOURCE"* ]]; then
    echo "Argument $SOURCE is not in the array list"
else
    case $SOURCE in
        # FLUENTD
        ${mysource[0]})
            kubectl apply -f fluent-bit-configmap.yml
            kubectl apply -f fluent-bit-role-binding.yml
            kubectl apply -f fluent-bit-role.yml
            kubectl apply -f fluent-bit-service-account.yml
            kubectl apply -f fluent-bit-daemonset.yml            
        ;;

        # ELASTICSEARCH
        ${mysource[1]})
            kubectl apply -f /FLUENTBIT/elasticsearch/deployment.yml
        ;;

        # KIBANA
        ${mysource[2]})
            kubectl apply -f /FLUENTBIT/kibana/deployment.yml   
        ;;        
    esac
fi