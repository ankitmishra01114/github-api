#!/bin/bash

# Github API URL

API_URL="https://api.github.com"

# Github Username and Personal access token

USERNAME=$username
TOKEN=$token

# User and Repository Information

Repo_Owner=$1
Repo_Name=$2

# Fnction to make a get request to the Github API

function get_api {
	local endpoint="$1"
	local url="${API_URL}/${endpoint}"

	# Send a Get request to the Github API with Authentication
	curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to List users with read access to the repository

function list_users_with_read_access {
	local endpoint="repos/${Repo_Owner}/${Repo_Name}/collaborators"

	# Fetch the list of Collaborators on the repository
	collaborators="$(get_api "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

	# Display the list of Collaborators with read access
	if [[ -z "$collaborators" ]]; then
		echo "No Users with read access found for ${Repo_Owner}/${Repo_Name}."
	else
		echo "Users with read access found for ${Repo_Owner}/${Repo_Name}:"
		echo "$collaborators"
	fi
}

# Main Script

echo "Listing users with read access to ${Repo_Owner}/${Repo_Name}..."
list_users_with_read_access
