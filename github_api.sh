#!/bin/bash
############
# Author: Keerthana
# Version: v0.0.1
# Usage: Instead of manually checking repo configs, this script makes the work easier

#set -x
set -e
set -o pipefail

#github_api url
API_URL="https://api.github.com"
#Export username and PAT
USERNAME="$username"
TOKEN="$token"

ORG_NAME=$1
REPO_NAME=$2

# API Call to get collaborators

function get_github_api {
        local org="$1"
        local url="${API_URL}/${org}"

        #make an api call to get the collaborators list with authentication
        curl -s -u "${USERNAME}:${TOKEN}" "$url"

}

#function to list members who have read access
function read_access_members {

    local endpoint="repos/${ORG_NAME}/${REPO_NAME}/collaborators"

    #fetch read_members of repo
    collaborators=$(get_github_api "$endpoint"| jq -r '.[] | select(.permissions.pull==true)|.login')

    if [ -z "$collaborators" ]; then
            echo "No users with read access found in ${ORG_NAME}/${REPO_NAME}."
    else
            echo "$collaborators"
    fi
}
#main_file
main_script (){
    echo "members who have read access to repo are"
    read_access_members

}

#Taking GIT ORG_NAME and REPO_NAME as Command line arguments

if [ "$#" -eq 2 ]; then
        main_script
else
        echo " Kindly provide 2 required aruguments <ORG_NAME> <REPO_NAME>"
        exit 1

fi
