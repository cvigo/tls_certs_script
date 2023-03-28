set -e

openssl genrsa -out ./ca/rootCA.key 4096
openssl req -x509 -new -nodes -key ./ca/rootCA.key -sha256 -days 3650 -out ./ca/rootCA.pem -subj "/C=MX/O=BBVA/CN=DB2 TLS Test - Root CA"

echo 1000 > ./ca/serial
touch ./ca/index.txt

openssl pkcs12 -export -inkey ./ca/rootCA.key -in ./ca/rootCA.pem -out ./ca/rootCA.p12
#openssl x509 -in ./ca/rootCA.crt -outform PEM -out ./ca/rootCA.pem
