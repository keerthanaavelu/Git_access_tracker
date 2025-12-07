🔍 GitAccessTracker

A simple shell script that uses the GitHub API to list users who have READ (pull) access to any GitHub repository.
Useful for DevOps audits, repo access checks, and security reviews.

🚀 Features

Fetch collaborators of any GitHub repo

Filter only users with READ access (pull)

Supports GitHub username & PAT via environment variables

Lightweight & fast (pure Bash + curl + jq)

📌 Prerequisites

Install jq

sudo apt install jq -y


Export your GitHub credentials:

export username="YOUR_GITHUB_USERNAME"
export token="YOUR_GITHUB_PAT"

▶️ Usage

Run the script with:

./git.sh <ORG_NAME> <REPO_NAME>


Example:

./git.sh careerupgradeNK beginner

Output:
<img width="940" height="235" alt="image" src="https://github.com/user-attachments/assets/a04b61f5-eb5a-401d-b83a-b05e2702e356" />
