# Captures Cisco ESA (Email Security Appliance)

Le Cisco ESA protège les flux email de la DMZ : réception, politiques, filtrage de contenu, chiffrement et supervision.

## Vue d'ensemble : dashboard de monitoring
Tableau de bord de supervision de l'ESA : volume d'emails traités, menaces détectées et état du système.

![Dashboard de monitoring](dashboard.png)

## 1. Configuration des listeners
Deux listeners gèrent les flux email :
- **IncomingMail** : réception des emails provenant de l'extérieur.
- **OutgoingMail** : envoi des emails vers l'extérieur.

![Listeners](listeners.png)

## 2. Mail Policies
Deux politiques sont définies :
- **Policy-User1** : règles adaptées à des utilisateurs spécifiques.
- **Default Policy** : politique par défaut pour tous les autres utilisateurs.

![Mail Policies](policies.png)

## 3. Outbreak Filters
Configurés au niveau 3 pour bloquer les campagnes d'emails malveillants en cours, à partir de la threat intelligence Cisco Talos.

![Outbreak Filters](outbreak.png)

## 4. Content Filters
Filtres de contenu actifs analysant les mots-clés, les pièces jointes et la taille des messages.

![Content Filters](content_filter.png)

Détail d'un filtre (annexe) :

![Détail du Content Filter 1](annexe_esa_content_filter1.png)

## 5. Chiffrement TLS
Chiffrement activé avec TLSv1.2 (ECDHE-RSA-AES256) pour garantir la confidentialité des messages en transit.

![Chiffrement TLS](tls.png)

## 6. Disclaimer
Message ajouté automatiquement en pied de page de tous les emails sortants.

![Disclaimer](disclaimer.png)

## 7. Rapports planifiés
Rapports générés automatiquement au format PDF.

![Rapports planifiés](report.png)

Exemple de rapport PDF généré (annexe) :

![Exemple de rapport PDF](annexe_esa_report_pdf.png)
