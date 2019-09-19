require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper
  
  def trope_list
    trope_html = Nokogiri::HTML(open("https://tvtropes.org/pmwiki/pmwiki.php/Main/Plots"))
    trope_index = trope_html.css("div.article-content.retro-folders ul")[1].children
    trope_index.each do |trope|
      url = trope.css('a')
      trope_url = url.map {|element| element["href"]}.compact
      text = trope.text
      divide = text.split(":")
      trope_name = divide[0]
      puts "#{trope_name}: #{trope_url}"
    end
  end
  
end

Scraper.new.trope_list

#plot index url: https://tvtropes.org/pmwiki/pmwiki.php/Main/Plots
#note 9/17:
#full trope index: trope_html.css("div.article-content.retro-folders ul")[1].children
#trope names: trope_html.css("div.article-content.retro-folders ul")[1].children.first.children[1].text
#trope page urls: trope_html.css("div.article-content.retro-folders ul")[1].children.first.children[1].attr("href