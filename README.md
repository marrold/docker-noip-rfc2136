# docker-noip-rfc2136
A simple container for running [noip-rfc2136](https://github.com/frillip/noip-rfc2136) - a "Simple HTTP(S) server that pretends to be a No-IP compatible DynDNS service, but actually performs RFC2136 updates to a DNS server."

## Source
The Dockerfile and associated configuration can be found on [github](https://github.com/marrold/docker-noip-rfc2136)

## Usage
For usage see the [noip-rfc2136](https://github.com/frillip/noip-rfc2136) documentation and pass the appropriate env vars to the container.

## Example docker-compose

    ---
    version: "2.1"
    
    services:
      noip-rfc2136:
        image: marrold/docker_noip_rfc2136:latest
        container_name: noip-rfc2136
        environment:
          - PUID=5000
          - PGID=5000
          - TZ=Europe/London
          - NOIP_RFC2136_LOG_LEVEL=INFO
          - NOIP_RFC2136_DNS_NAMESERVER=198.51.100.10
          - NOIP_RFC2136_DNS_ZONE=example.org.
          - NOIP_RFC2136_DNS_TTL=300
          - NOIP_RFC2136_DNS_TSIG_KEY_NAME=key.
          - NOIP_RFC2136_DNS_TSIG_KEY_SECRET="u/ULUGT0p7gP44XYEVkWzTv3fKiweURD9PyJ4vqMhZQ="
          - NOIP_RFC2136_LISTEN_HOST=127.0.0.1
          - NOIP_RFC2136_LISTEN_PORT=8000
          - NOIP_RFC2136_HTTPS_ENABLED=False
          - NOIP_RFC2136_AUTH_ENABLED=False
          - NOIP_RFC2136_BASIC_AUTH_USERNAME=user
          - NOIP_RFC2136_BASIC_AUTH_PASSWORD=password
        ports:
          - 8000:8000/tcp
        restart: unless-stopped

## License

This project is licensed is licensed under the terms of the _MIT license_. For other dependencies such as noip-rfc2136 and Docker, please see their relevant licenses.

