curl "http://localhost:4741/teams" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "team": {
      "team_name": "'"${TEAM}"'",
      "sport": "'"${SPORT}"'",
      "trophies": "'"${TROPHIES}"'"
    }
  }'

echo
