#!/usr/bin/env bash

Domain=""
Organization=""
Organizational_Unit=""
State=""
Locality=""
Country=""

site_name=`sed 's/\./_/' <(echo $Domain)`

openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout ../nginx/ssl/private/$site_name.key \
	-out ../nginx/ssl/certs/$site_name.crt \
	-subj "/C=$Country/ST=$State/L=$Locality/O=$Organization/OU=$Organizational_Unit/CN=$Domain"
openssl dhparam -out ../nginx/ssl/certs/dhparam.pem 2048