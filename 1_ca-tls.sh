docker-compose up -d ca-tls
sleep 5

export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/tls-ca/crypto/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/tls-ca/admin

fabric-ca-client enroll -d -u https://tls-ca-admin:tls-ca-adminpw@0.0.0.0:7052
sleep 5

fabric-ca-client register -d --id.name peer1-org1 --id.secret peer1PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer2-org1 --id.secret peer2PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer1-org2 --id.secret peer1PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer2-org2 --id.secret peer2PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name orderer1-org0 --id.secret ordererPW --id.type orderer -u https://0.0.0.0:7052

echo
fabric-ca-client identity list
