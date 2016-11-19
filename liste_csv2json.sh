# géocodage de la liste avec addok local (sur port 7979)
curl http://localhost:7979/search/csv/ -F data=@ListeOF.csv -F columns=adr_rue_physique -F columns=adr_code_postal_physique -F columns=adr_ville_physique > ListeOF-geo.csv

# transformation CSV en json pour addok
cat ListeOF-geo.csv | csvjson | jq '.[]|{name: .da_raison_sociale, id: .numero_de_da, context: (.numero_de_da + ", "+.da_siren+", "+(.da_siren+.da_no_etab)+", "+.adr_code_postal_postale[:2]), da_raison_sociale, da_siren, da_no_etab, adr_rue_physique, adr_rue_complement_physique, postcode: .adr_code_postal_physique, city: .adr_ville_physique, adr_rue_postale, adr_rue_complement_postale, adr_code_postal_postale, adr_ville_postale, lat: (.latitude+"0")|tonumber, lon: (.longitude+"0")|tonumber, citycode: .result_citycode, geo_score: (.result_score+"0")|tonumber, geo_type: .result_type}' -c > liste_of.json

