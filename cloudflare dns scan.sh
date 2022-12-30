#!/bin/bash

# Set the Cloudflare API key
api_key="PENIS"

# Prompt the user for the zone name
read -p "Enter the zone name: " zone_name

full_response=false
has_zone=false

# Check if the --full flag was passed
if test "$1" == "--full"; then
  # The --full flag was passed
  full_response=true
  # Shift the arguments to the left (i.e. remove the --full flag from $1)
  shift
fi

# Check if the zone is already in your account
response=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$zone_name" \
  -H "Authorization: Bearer $api_key" \
  -H "Content-Type: application/json")

# Check the response status
if test $(echo $response | jq '.result | length') -gt 0; then
  # The zone exists in your account
  has_zone=true
  # Extract the zone ID from the response
  zone_id=$(echo $response | jq -r '.result[0].id')
else
  # The zone does not exist in your account

  # Add the zone to your Cloudflare account
  response=$(curl -s -X POST "https://api.cloudflare.com/client/v4/zones" \
    -H "Authorization: Bearer $api_key" \
    -H "Content-Type: application/json" \
    --data "{\"name\":\"$zone_name\"}")

  # Extract the zone ID from the response
  zone_id=$(echo $response | jq -r '.result.id')

  # Run a DNS scan on the zone
  response=$(curl -s -X POST "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/scan" \
  -H "Authorization: Bearer $api_key" \
  -H "Content-Type: application/json")
fi

# List all DNS records for the zone
response=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records" \
  -H "Authorization: Bearer $api_key" \
  -H "Content-Type: application/json")

# Print the DNS records to STDOUT
if [ "$full_response" = true ]; then
  echo $response | jq -r '.result[] | "\(.type) \(.name) \(.content)"'
else
  echo $response | jq -r '.result[] | "\(.name)"'
fi
