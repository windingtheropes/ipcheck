#!/bin/bash
ip=$(dig +short txt ch whoami.cloudflare @1.0.0.1); ip="${ip#?}"; ip="${ip%?}"
echo $ip
