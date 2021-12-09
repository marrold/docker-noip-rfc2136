# docker-noip-rfc2136
A simple container for running [noip-rfc2136](https://github.com/frillip/noip-rfc2136) - a "Simple HTTP(S) server that pretends to be a No-IP compatible DynDNS service, but actually performs RFC2136 updates to a DNS server."

## Usage
Define the following as environment variables in your docker-compose file:

### Logging config
 * `log_level`: The log level. Can be one of `NOTSET` `DEBUG` `INFO` `WARNING` `ERROR` `CRITICAL` 

### DNS
 * `dns_nameserver`: The IP of the DNS server you want to update
 * `dns_zone`: The zone you want to update
 * `dns_ttl`: TTL of the record
 * `dns_tsig_key_name`: String containing the TSIG key name
 * `dns_tsig_key_secret`: Base64 encoded string containing the TSIG key secret

### HTTP server config
 * `listen_host`: The IP address the HTTP should bind to. Set to `None` to listen on ALL addresses (not recommended).
 * `listen_port`: The port the HTTP server should listen on.

### HTTPS config
 * `ssl_enabled`: Set to `True` to enable HTTPS, `False` for plain HTTP.
 * `ssl_key_file`: Path to HTTPS private key file
 * `ssl_cert_file`: Path HTTPS certificate file

### HTTP basic auth config
 * `basic_auth_enabled`: Set to `True` to enable HTTP basic auth, `False` to disable.
 * `basic_auth_user`: String containing HTTP basic username
 * `basic_auth_pass`: String containing HTTP basic password

## Example docker-compose

    ---
    version: "2.1"
    
    services:
      noip-rfc2136-2:
        image: noip-rfc2136
        container_name: noip-rfc2136
        environment:
          - PUID=5000
          - PGID=5000
          - TZ=Europe/London
          - log_level=INFO
          - dns_nameserver=198.51.100.10
          - dns_zone=example.org.
          - dns_ttl=300
          - dns_tsig_key_name=key.
          - dns_tsig_key_secret="u/ULUGT0p7gP44XYEVkWzTv3fKiweURD9PyJ4vqMhZQ="
          - listen_host=127.0.0.1
          - listen_port=8000
          - ssl_enabled=False
          - basic_auth_enabled=False
          - basic_auth_user=user
          - basic_auth_pass=password
        ports:
          - 8000:8000/tcp
        restart: unless-stopped

## License

This project is licensed is licensed under the terms of the _MIT license_. For other dependencies such as noip-rfc2136 and Docker, please see their relevant licenses.

