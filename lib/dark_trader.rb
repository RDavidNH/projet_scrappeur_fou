require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
all_currencies = page.xpath('//table/tbody/tr/td[2]')

res = []

all_currencies.each do |curr|
      res << curr.text
      puts curr.text #ou n'importe quelle autre opération de ton choix ;)
end

p res
