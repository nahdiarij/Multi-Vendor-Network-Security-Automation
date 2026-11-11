#!/bin/bash
export ANSIBLE_NETWORK_CLI_SSH_TYPE=paramiko
export PARAMIKO_TRANSPORT_FACTORY=paramiko
export ANSIBLE_SSH_ARGS="-o KexAlgorithms=+diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1 -o MACs=+hmac-sha1,hmac-sha1-96 -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedKeyTypes=+ssh-rsa"
