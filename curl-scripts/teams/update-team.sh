curl "http://localhost:4741/teams/${ID}" \
--include \
--request PATCH \
--header "Content-Type: application/json" \
--header "Authorization: Token token=${TOKEN}" \
--data '{
  "dropoff": {
    "date_dropping_off": "'"${DATE}"'",
    "load_type": "'"${LOAD}"'",
    "note": "'"${NOTE}"'"
  }
}'

echo
