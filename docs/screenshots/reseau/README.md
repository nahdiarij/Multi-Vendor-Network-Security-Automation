# Routeurs et switch : running-configurations

Le routage inter-zones et la segmentation du réseau sont assurés par des routeurs Cisco CSR1000v et un switch Cisco Catalyst 2960. Les captures ci-dessous présentent leurs configurations en cours (`show running-config`).

| Équipement | Rôle |
|---|---|
| Routeurs (CSR1000v) | Routage inter-zones, NAT |
| Switch SW1 (Catalyst 2960) | Commutation, VLANs, isolation du trafic |

## Routeurs

### R13
![Running configuration R13](annexe_r13_config.png)

### R2
![Running configuration R2](annexe_r2_config.png)

### R3
![Running configuration R3](annexe_r3_config.png)

## Switch

### SW1
![Running configuration SW1](annexe_sw1_config.png)

> Les secrets et mots de passe ont été masqués. SW1 est aussi la cible du test Ettercap (voir le dossier des tests de sécurité) : une protection **Dynamic ARP Inspection (DAI)** est une amélioration envisagée.
