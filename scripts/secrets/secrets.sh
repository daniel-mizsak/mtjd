#!/usr/bin/env bash

# Read password in a hidden way
read -sp "Enter your password: " SECRET
echo -e "\n"

# Encrypt by: `openssl enc -aes-256-cbc -in OP_SERVICE_ACCOUNT_TOKEN -out OP_SERVICE_ACCOUNT_TOKEN.enc -pbkdf2`
OP_SERVICE_ACCOUNT_TOKEN=$(openssl enc -d -aes-256-cbc -in OP_SERVICE_ACCOUNT_TOKEN.enc -pass pass:"$SECRET" -pbkdf2 2>/dev/null)
if [[ $? -ne 0 ]]; then
    echo "Incorrect password. Exiting."
    exit 1
fi
export OP_SERVICE_ACCOUNT_TOKEN
echo "1Password service account token successfully set."

op read --out-file ~/.ssh/id_github "op://Development/id_github/private key?ssh-format=openssh"
echo "GitHub SSH key successfully set."
