# tls_certs_script

Simple script to generate a CA and some Server Certificates.

- run `createCA.sh` to create the CA
- run `createServerCerts.sh <expiration date> <files name without extensions>` as many times as yoy need

Delete all non-hidden files in `./certs` and `./ca` to start over
