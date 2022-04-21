#appeler ce que l'on va utiliser
require "open-uri" #permet d'accéder à n'importe quel site (ou page web)
require "nokogiri" #permet d'accéder à chaque noeud (élément) du site
require "csv" #permettra de convertir les données stockees dans un array en csv à l'aide de séparateurs

#méthode de scraping principale
def scraping(url)
    html = URI.open("#{url}").read     #ligne pour ouvrir l'url et la lire
    nokogiri_doc = Nokogiri::HTML(html) # prendre le site (comme argument) et le convertir avec nokogiri
    final_array = []#ensuite on veut un tableau vide dans lequel on va sauvegarder les éléments
    #maintenant on passe aux méthodes intégrées nokogiri
    doc.xpath(/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div).each do |element|
    #nokogiri_doc.search("div.sc-1ibw5f9-0 bpOMHJ").each do |element| #ici on va rechercher les noeuds sur le site qui contiennent une certaine classe
    #on passe les classes des éléments qu'on veut en tant qu'argument, mais il faut chercher les classes parents
    puts "d"
    element = element.text #ne va garder que le contenu textuel
    puts "e"
    final_array << element #on met les elements les uns après les autres dans l'array
    puts "f"
    end

#fin du scraping
#maintenant on ordonne les elements dans notre tableau
    final_array.each_with_index do |index, element|
        puts "#{index + 1} - #{element}"
    end

end


scraping('https://coinmarketcap.com/all/views/all/')


#ensuite il faut tout mettre dans le fichier csv
#filepath = "test.csv"
#csv_options = {headers: :first_row, col_sep: ','}
#CSV.open(filepath, 'wb', csv_options) do |csv|
#csv << ['title', 'index']


