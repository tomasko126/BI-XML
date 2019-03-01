# Validácia XML súborov (RelaxNG)
xmllint --noout --relaxng validation/main.rng xml/dominica.xml xml/kosovo.xml xml/saint-kitts-and-nevis.xml xml/seychelles.xml

# Validácia XML súborov (DTD)
xmllint --noout --dtdvalid validation/main.dtd xml/dominica.xml xml/kosovo.xml xml/saint-kitts-and-nevis.xml xml/seychelles.xml

# Spojenie XML krajín do jedného súboru
xmllint --dropdtd --noent xml/kombinacia.xml > xml/countries.xml

# Vytvorenie index.html stránky
saxon xml/countries.xml xslt/index.xslt > html/index.html

cd xml/

# Vytvorenie HTML stránok krajín
saxon countries.xml ../xslt/countries.xslt

# Vytvorenie PDF súboru krajín
saxon countries.xml ../xslt/pdf.xslt > ../xslt/countries.fo
fop -fo ../xslt/countries.fo -pdf ../html/countries.pdf
