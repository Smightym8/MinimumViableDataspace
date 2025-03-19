#!/bin/bash

## Seed management DATA to identityhubs
API_KEY="c3VwZXItdXNlcg==.c3VwZXItc2VjcmV0LWtleQo="

# add consumer participant
echo
echo
echo "Create consumer participant"
CONSUMER_CONTROLPLANE_SERVICE_URL="http://192.168.1.101:8082"
CONSUMER_IDENTITYHUB_URL="http://192.168.1.101:7082"
DATA_CONSUMER=$(jq -n --arg url "$CONSUMER_CONTROLPLANE_SERVICE_URL" --arg ihurl "$CONSUMER_IDENTITYHUB_URL" '{
           "roles":[],
           "serviceEndpoints":[
             {
                "type": "CredentialService",
                "serviceEndpoint": "\($ihurl)/api/credentials/v1/participants/ZGlkOndlYjpjb25zdW1lci1pZGVudGl0eWh1YiUzQTcwODM6Y29uc3VtZXI=",
                "id": "consumer-credentialservice-1"
             },
             {
                "type": "ProtocolEndpoint",
                "serviceEndpoint": "\($url)/api/dsp",
                "id": "consumer-dsp"
             }
           ],
           "active": true,
           "participantId": "did:web:192.168.1.101%3A7083:consumer",
           "did": "did:web:192.168.1.101%3A7083:consumer",
           "key":{
               "keyId": "did:web:192.168.1.101%3A7083:consumer#key-1",
               "privateKeyAlias": "did:web:192.168.1.101%3A7083:consumer#key-1",
               "keyGeneratorParams":{
                  "algorithm": "EC"
               }
           }
       }')

curl --location 'http://localhost:7081/api/identity/v1alpha/participants/' \
--header 'Content-Type: application/json' \
--header "x-api-key: $API_KEY" \
--data "$DATA_CONSUMER"