# API de recherche d'organismes de formation

**Cette API est expérimentale, mais fonctionnelle.**

*La disponibilité de l'API n'est pas garantie, elle fonctionne sur un simple serveur scaleway C1.*

Le moteur de recherche d'adresses "addok" est détourné de sa destination initiale pour chercher des organismes de formations d'après leur nom, numéro SIREN ou SIRET, numéro de déclaration d'activité, ville.

Il permet de trouver des organismes à l'aide d'une unique zone de saisie en mode "auto-complétion".

## Fonctionnement de l'API

Elle est disponible sur http://of.addok.xyz/search

Les paramètres:

- q: texte sur lequel faire la recherche
- limit: nombre maximum de réponses
- autocomplete: 0 = pas d'autocomplétion, 1 = autocomplétion (par défaut)

Exemples de requêtes:

Sur un nom + nom de ville:
http 'http://of.addok.xyz/search?q=GRETA GUERET'

Sur un SIRET:
http 'http://of.addok.xyz/search?q=44158313500039'

Sur un n° de déclaration d'activité:
http 'http://of.addok.xyz/search?q=93060084406'


La réponse est au format geojson.

Les champs en "properties" sont:
- da_raison_sociale / name : nom de l'organisme
- id : n° de déclaration d'activité
- da_siren : n° SIREN de l'établissement
- da_no_etab : n° de l'établissement (combine à da_siren ceci donne le SIRET)
- adr_rue_physique / postcode / city : adresse physique de l'organisme
- adr_rue_postale / adr_code_postal_postale / adr_ville_postale : adresse postale de l'établissement

Ces informations proviennent du fichier d'origine.

- score : score de correspondance entre le texte à chercher et l'information trouvée par l'API.

Informations complémentaires issues du géocodage du fichier d'origine:
- citycode : code INSEE de la commune correspondant à l'adresse géocodée
- geo_score : score de géocodage (plus il est élevé plus fiable est le résultat)
- geo_type : type d'adresse trouvée (housenumber = N°, street = rue, locality = lieu-dit)
- geometry : contient la position latitude/longitude en degrés WG84 issue du géocodage ou 0,0 si rien de trouvé
