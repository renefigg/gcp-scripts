#!/bin/bash
# VPC Peering Data Fusion
# Version: 1.0
# Date: July 2021
# Author: Rene Figueroa
# Email: figueroaorozco@google.com

if [ -z "$1" ]; then
    echo -e "\n ---Script VPC Peering Data Fusion v.1.0---"
    echo "usage: vpc-peering-datafusion.sh <DATA-FUSION-INSTANCE-NAME> <REGION>"
    echo "example: vpc-peering-datafusion.sh datafusion-public us-central1" 
    echo -e "!\n"
    exit 1
fi


DF_INSTANCE_NAME=$1
DF_LOCATION=$2
DF_NETWORK="$2"-"$1"
gcloud beta data-fusion instances describe \
    $DF_INSTANCE_NAME \
    --location $DF_LOCATION \
    --format=config > df-desc.txt
DF_PROJECT_ID=$(grep tenantProjectId df-desc.txt | awk {'print $3'})
DF_ZONE=$(grep zone df-desc.txt | awk {'print $3'})
PROJECT_ID=$(gcloud config get-value project)
NETWORK=$(grep "network " df-desc.txt | awk {'print $3'})
VPC_PEERING="$DF_INSTANCE_NAME"-vpc-peering
echo "==============================="
echo "Current Project Information:"
echo "PROJECT-ID: $PROJECT_ID"
echo "REGION: $DF_LOCATION"
echo "NETWORK: $NETWORK"
echo "------------------------------"
echo "Data Fusion Information:"
echo "PROJECT-ID: $DF_PROJECT_ID"
echo "ZONE: $DF_ZONE" 
echo "INSTANCE: $DF_INSTANCE_NAME"
echo "NETWORK: $DF_NETWORK"
echo "------------------------------"
echo "VPC Peering Information"
echo "VPC Peering Name: $VPC_PEERING"
echo "==============================="
echo "CREACION DE VPC PEERING ..."

#gcloud compute networks peerings create $VPC_PEERING \
#    --network $NETWORK \
#    --peer-network $DF_NETWORK \
#    --peer-project $DF_PROJECT_ID \
#    --auto-create-routes
#    --export-custom-routes
#    --import-custom-routes
