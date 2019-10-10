require 'nokogiri'
require 'open-uri'


def crypto_scrapper
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  # récupération des données du tableau
  table_rows = page.xpath('//table[@id="currencies-all"]/tbody/tr')
  crypto_names = page.xpath('//table[@id="currencies-all"]/tbody/tr/td[3]')
  crypto_values = page.xpath('//table[@id="currencies-all"]/tbody/tr/td[5]/a')

  puts "Fetching data..."

  results = []

  # génération du Hash et création du tableau de résultat final
  table_rows.length.times do |i|
    res = Hash.new
    res[crypto_names[i].text] = crypto_values[i]['data-usd'].to_f.round(2)
    results << res
  end

  return results

end

# execution
p crypto_scrapper
