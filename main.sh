#!/bin/bash

read -p "Do you wish to deploy the global resource? " yn
case $yn in
    [Yy]* ) 
        read -p "Enter the name for the resource group: " globalRG 
        echo -e "\n" . $globalRG
        read -p "Enter region for the GLOBAL deployment [W]est US, [E]ast US, [C]entral US: " globalLocation
        case $globalLocation in
            [Ww]* ) echo -e "w"
            ;;
            [Ee]* ) echo -e "e"
            ;;
            [Cc]* ) echo -e "c"
            ;;
            * ) echo -e "Invalid response.. moving on...\n";;
       esac ;;

    [Nn]* ) echo -e "Skipping ... \n"
esac
read -p "Is this for [P]roduction or [T]esting: " prodOrTest
case $prodOrTest in
    [Pp]* ) 
      az group create --name ExampleGroup --location "Central US"
      az group deployment create \
        --name ExampleDeployment \
        --resource-group ExampleGroup \
        --template-file deploy.json
    exit
    ;;
    [Tt]* ) echo -e "t"
    exit
    ;;
    * ) echo -e "Invalid response.. exiting...\n";;
esac 

