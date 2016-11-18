# récupération des libellés des spécialités sur ancien formulaire de recherche
curl 'http://web.archive.org/web/20160114195407/https://www.listeof.travail.gouv.fr/index.php?module=Listeof&action=Recherche' > ancien_formulaire.html
echo "code_specialite,libelle_specialite" > specialite_formation.csv
grep '100 - ' ancien_formulaire.html | head -n 1 | sed 's!</option>!\n!g' | sed 's!^.*>!!;s! - !,!' >> specialite_formation.csv 


