require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper
  
  def trope_list
    trope_index = Nokogiri::HTML(open("https://tvtropes.org/pmwiki/pmwiki.php/Main/Plots"))
    binding.pry
  end
  
end

Scraper.new.trope_list

#plot index url: https://tvtropes.org/pmwiki/pmwiki.php/Main/Plots
#note 9/17: still attempting to find the right css selector for scraping. the closest i've gotten is as follows:       trope_index.css("div.article-content.retro-folders ul")[1]
# continue experimenting to find the best selector