#!/bin/bash

# Generate server listening cert using let's encrypt
if [[ ! -e /etc/letsencrypt/live/matchbox.condi.me/privkey.pem ]]; then
	certbot certonly \
		--webroot --webroot-path /var/www/localhost/ \
		--domains matchbox.condi.me
fi

# Use the same server key as the source material of our own CA
if [[ ! -e /etc/matchbox/server.key ]]; then
	ln -s /etc/letsencrypt/live/matchbox.condi.me/privkey.pem /etc/matchbox/server.key
fi
if [[ ! -e /etc/matchbox/server.crt ]]; then
	ln -s /etc/letsencrypt/live/matchbox.condi.me/fullchain.pem /etc/matchbox/server.crt
fi
if [[ ! -e /etc/matchbox/ca.crt ]]; then
	certtool --generate-self-signed \
		--load-privkey /etc/matchbox/server.key \
		--template /etc/matchbox/ca.template \
		--outfile /etc/matchbox/ca.crt
fi

# Use our local CA certificate to generate client certificates.
# Only clients which present certificates signed by this CA will be permitted.
if [[ ! -e /etc/matchbox/client.key ]]; then
	certtool --generate-privkey > /etc/matchbox/client.key
fi
if [[ ! -e /etc/matchbox/client.crt ]]; then
	certtool --generate-certificate \
		--load-privkey /etc/matchbox/client.key \
		--load-ca-privkey /etc/matchbox/server.key \
		--load-ca-certificate /etc/matchbox/ca.crt \
		--template /etc/matchbox/client.template > /etc/matchbox/client.crt
fi
