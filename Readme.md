# GitHub Repository Access Checker

A Bash script that uses the GitHub REST API to list users who have read access to a GitHub repository.

## 📌 Project Overview

This project is a Bash-based GitHub API automation script.

The script accepts a repository owner and repository name as command-line arguments, calls the GitHub API using `curl`, and uses `jq` to filter collaborators who have read permission.

This project helped me practice Bash scripting, API integration, JSON parsing, command-line arguments, and Git/GitHub.

## 🛠️ Technologies Used

* Bash
* GitHub REST API
* cURL
* jq
* Git
* GitHub

## 📂 Project Structure

```text
github-api/
│
├── list_users.sh
└── README.md
```

## ⚙️ Prerequisites

Make sure the following are installed:

* Linux / WSL / Ubuntu
* Bash
* cURL
* jq
* Git
* GitHub account

Check the installations:

```bash
bash --version
curl --version
jq --version
git --version
```

## 🔐 Authentication

The script uses a GitHub username and Personal Access Token for authentication.

Set your GitHub username:

```bash
export username="your-github-username"
```

Set your GitHub Personal Access Token:

```bash
export token="your-github-token"
```

The script reads these values using:

```bash
USERNAME=$username
TOKEN=$token
```

⚠️ Never hard-code your GitHub token inside the script or commit it to GitHub.

## ▶️ How to Run

First, make the script executable:

```bash
chmod +x list_users.sh
```

The script requires exactly two command-line arguments:

```bash
./list_users.sh Repo_Owner Repo_Name
```

Example:

```bash
./list_users.sh DevOpsBoom demo-repository
```

## 🔍 How the Script Works

1. Stores the GitHub API base URL.
2. Reads the GitHub username and Personal Access Token from environment variables.
3. Accepts the repository owner as the first argument.
4. Accepts the repository name as the second argument.
5. The `helper` function checks whether exactly two arguments were provided.
6. The `get_api` function sends a GET request to the GitHub API using `curl`.
7. The `list_users_with_read_access` function requests the repository collaborators.
8. `jq` filters users whose `pull` permission is set to `true`.
9. The script displays the users with read access.

## 🧩 Functions Used

### `get_api`

Makes an authenticated GET request to the GitHub API.

### `list_users_with_read_access`

Fetches repository collaborators and filters users with read permission using `jq`.

### `helper`

Checks whether the script received the required number of command-line arguments.

## 💡 Example

Run:

```bash
./list_users.sh DevOpsBoom demo-repository
```

Output:

```text
Listing users with read access to DevOpsBoom/demo-repository...
Users with read access found for DevOpsBoom/demo-repository:
username1
username2
```

If no users are found:

```text
No Users with read access found for DevOpsBoom/demo-repository.
```

## 📚 What I Learned

Through this project, I practiced:

* Bash scripting
* Bash functions
* Local variables
* Command-line arguments
* Argument validation
* Environment variables
* GitHub REST API
* API authentication
* `curl`
* JSON parsing with `jq`
* Git and GitHub

## 🔒 Security

GitHub Personal Access Tokens are sensitive credentials.

Never:

* Put the token directly in the script
* Commit the token to GitHub
* Share the token publicly

Use environment variables instead:

```bash
export username="your-github-username"
export token="your-github-token"
```

If a token is accidentally exposed, revoke it immediately and create a new one.

## 🚀 Future Improvements

Possible improvements for this project:

* Add API error handling
* Check whether the repository exists
* Handle invalid credentials
* Handle GitHub API rate limits
* Display different permission levels
* Add better command-line argument handling
* Add logging

## 👨‍💻 Author

**Ankit Mishra**

GitHub:
[https://github.com/ankitmishra01114](https://github.com/ankitmishra01114)

## 📄 License

This project was created for learning and educational purposes.
