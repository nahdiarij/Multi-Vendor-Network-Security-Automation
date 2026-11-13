# Captures Cisco ASA

Deux pare-feux Cisco ASA virtuels (ASAv-haut et ASAv-bas) sont déployés dans la DMZ. Ils appliquent un filtrage stateful et segmentent le réseau en zones de sécurité.

## 1. Zones de sécurité
Les interfaces sont assignées à des zones avec un niveau de sécurité :
- **Outside** : niveau 0 (réseau non fiable)
- **DMZ** : niveau 50 (zone démilitarisée)
- **Inside** : niveau 100 (réseau interne de confiance)

![Zones de sécurité](asa_zone.png)

## 2. Access Lists (ACL)
Les ACL définissent précisément le trafic autorisé ou bloqué entre les zones.

![Access List](access-list.png)
![ACL entre zones](asa_acl.png)

## 3. Service Policy
Politique d'inspection appliquée au trafic traversant l'ASA (inspection stateful des connexions).

![Service Policy](service-policy.png)

## 4. VPN
Tunnel VPN sécurisé entre la DMZ et le réseau interne.

![VPN ASA](vpn-asa.png)

## 5. Configurations complètes (annexe)

### ASAv-haut
![Running configuration ASAv-haut](annexe_asa_haut_config.png)

### ASAv-bas
![Running configuration ASAv-bas](annexe_asa_bas_config.png)

> Les secrets et clés ont été masqués.
