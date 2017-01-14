#!/bin/bash

echo -n "Github Username: "
read USER

echo -n "Password: "
read PASS

echo -n "Repo (e.g. cyclejs/core); "
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)
REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Delete default labels
curl -u "$USER:$PASS" -i -X DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug"
curl -u "$USER:$PASS" -i -X DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate"
curl -u "$USER:$PASS" -i -X DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement"
curl -u "$USER:$PASS" -i -X DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted"
curl -u "$USER:$PASS" -i -X DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid"
curl -u "$USER:$PASS" -i -X DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question"
curl -u "$USER:$PASS" -i -X DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix"

# Create new labels
## Issue types
curl -u "$USER:$PASS" -i -X POST -d '{"name": "discussion (is always a closed issue)", "color": "fef2c0"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "issue is bug", "color": "ff0000"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "issue is feature suggestion", "color": "33eeee"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "issue is breaking suggestion", "color": "5319e7"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

## Statuses
curl -u "$USER:$PASS" -i -X POST -d '{"name": "labels pending!", "color": "fc79db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "help wanted", "color": "009800"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "in progress", "color": "FFCC00"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

## Weights (Urgency)
curl -u "$USER:$PASS" -i -X POST -d '{"name": "priority: 1 (maybe)", "color": "eeeeee"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "priority: 2 (could)", "color": "aaaaaa"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "priority: 3 (should)", "color": "777777"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "priority: 4 (must)", "color": "000000"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

## Resolutions
curl -u "$USER:$PASS" -i -X POST -d '{"name": "resolution: can'"'"'t reproduce", "color": "bfdadc"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "resolution: duplicate issue", "color": "bfdadc"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "resolution: bug fixed", "color": "bfdadc"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "resolution: invalid", "color": "bfdadc"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u "$USER:$PASS" -i -X POST -d '{"name": "resolution: works as expected", "color": "bfdadc"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
