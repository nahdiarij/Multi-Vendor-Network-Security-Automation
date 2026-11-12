# Captures Cisco FTD (via FDM)

Le Cisco Firepower Threat Defense est administré via l'interface FDM (Firepower Device Manager).

## 1. Configuration des interfaces
Les interfaces du FTD sont configurées et assignées aux zones de sécurité correspondantes.

![Interfaces FTD](FTD/ftd_interfaces.png)

## 2. Access Control Policy
Règles d'autorisation et de blocage du trafic (Allow, Block, Trust).

![Access Control Policy - vue 1](FTD/ftd-acl.png)
![Access Control Policy - vue 2](FTD/ftd_acl2.png)
![Access Control Policy - FTD 2](FTD/acl_ftd2.png)

## 3. SSL Decryption
Inspection du trafic HTTPS chiffré selon deux modes :
- **Decrypt - Resign** : trafic sortant (LAN vers Internet)
- **Do Not Decrypt** : flux sensibles (banques, services gouvernementaux)

![SSL Decryption](FTD/ftd_ssl.png)
![Politique de déchiffrement](FTD/ssl-dec.png)
