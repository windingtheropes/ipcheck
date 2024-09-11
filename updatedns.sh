#!/bin/bash
dnsid=$(cat /root/dnsid)
ip=$(sh /root/getip.sh)
key=$(cat /root/key)

JSON_FMT='{"content":"%s","name":"neon.alacriware.com","proxied":false,"type":"A","comment":"main","id":"%s","tags":[],"ttl":3600}\n'
REQ_BODY=$(printf "$JSON_FMT" "$ip" $"dnsid")

echo "Updating cloudflare dns record for neon.alacriware.com"
res=$(curl --request PATCH \
  --url https://api.cloudflare.com/client/v4/zones/$(cat /root/zone)/dns_records/$(cat /root/dnsid) \
  --header "Authorization: X-Auth-Email" \
  --header "X-Auth-Email: jaandersonck@gmail.com" \
  --header "X-Auth-Key: ${key}" \
  --header "Content-Type: application/json" \
  --data $REQ_BODY)

success='"'"success"'"'":""true"
fail='"'"success"'"'":""false"
case "$res" in 
     *$success* )
   echo "Updated successfully."
esac
case "$res" in 
     *$fail* )
   echo "Update failed."
   echo $res
esac


