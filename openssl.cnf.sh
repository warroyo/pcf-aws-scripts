source ./vars.env
cat << EOF > openssl.cnf
[req]
distinguished_name = req_distinguished_name
req_extensions = v3_req

[req_distinguished_name]
countryName = Country Name (2 letter code)
countryName_default = US
stateOrProvinceName = State or Province Name (full name)
stateOrProvinceName_default = WA
localityName = Locality Name (eg, city)
localityName_default = Seattle
organizationalUnitName  = Organizational Unit Name (eg, section)
organizationalUnitName_default  = Company Organization Unit
commonName = *.$DOMAIN
commonName_max  = 64

[ v3_req ]
# Extensions to add to a certificate request
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = *.sys.$DOMAIN
DNS.2 = *.login.sys.$DOMAIN
DNS.3 = *.uaa.sys.$DOMAIN
DNS.4 = *.apps.$DOMAIN
EOF