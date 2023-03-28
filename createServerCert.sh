if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <expiration date> <files name without extensions>"
    echo "Expiration date must be in the format YYYYMMDDHHMMSSZ (Z is mandatory)"
    exit 1
fi

set -e

openssl genrsa -out "./certs/$2.key" 2048
openssl req -new -key "./certs/$2.key" -out "./certs/$2.csr" -config server.cnf

openssl ca -config ./server.cnf -out "./certs/$2.pem" -extensions req_ext -enddate "$1" -infiles "./certs/$2.csr"

#openssl ca -config /etc/openssl.cnf -policy policy_anything -out clientcert.pem -startdate 120815080000Z -enddate 120815090000Z -cert ca.pem -keyfile cakey.pem -infiles clientcert.csr


openssl pkcs12 -export -inkey "./certs/$2.key" -in "./certs/$2.pem" -out "./certs/$2.p12"

#rm -f "./certs/$2.csr"