require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = 'https://en.wikipedia.org/wiki/Category:Pizza_styles'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  pizza_types = parsed_page.css('.mw-category-group li a')
  pizza_types.each do |element|
    p element.attributes['title'].value
  end
end

scraper