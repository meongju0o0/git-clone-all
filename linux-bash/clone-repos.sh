#!/bin/bash

USERNAME="meongju0o0"
PAGE=1

while true; do
    REPO_URLS=$(curl -s "https://api.github.com/users/$USERNAME/repos?page=$PAGE&per_page=100" | jq -r ".[].clone_url")

    # Check if the response is empty, if so, break out of the loop
    if [[ -z "$REPO_URLS" ]]; then
        break
    fi

    for REPO_URL in ${(f)REPO_URLS}; do
        REPO_NAME=$(basename -s .git $REPO_URL)
        if [[ -d $REPO_NAME ]]; then
            echo "Updating existing repository: $REPO_NAME"
            cd $REPO_NAME
            git fetch origin
            
            # Check for local changes and either pull or show a warning
            if git diff --quiet; then
                git pull origin master
            else
                echo "Warning: Local changes detected in $REPO_NAME - skipping pull"
            fi

            cd ..
        else
            echo "Cloning new repository: $REPO_NAME"
            git clone $REPO_URL
        fi
    done

    # Increment the page number and check if there's a next page
    PAGE=$((PAGE+1))
    STATUS_CODE=$(curl -I -s "https://api.github.com/users/$USERNAME/repos?page=$PAGE&per_page=100" | grep "HTTP/2" | awk '{print $2}')
    
    if [[ "$STATUS_CODE" -ne 200 ]]; then
        break
    fi
done
