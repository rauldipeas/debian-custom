#!/bin/bash
set -e
# Actions cleanup
PROJECT='rauldipeas/debian-custom'
KEEP=5
gh api repos/"$PROJECT"/actions/runs --paginate -q '.workflow_runs[]|select(.head_branch != "any")|"\(.id)"'|tail -n+$((KEEP+1))|xargs -n1 -I % gh api repos/"$PROJECT"/actions/runs/% -X DELETE