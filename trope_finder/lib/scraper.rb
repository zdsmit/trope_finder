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
#note 9/16: not sure if nokogiri is functioning right. experiment with different urls to make sure class is scraping data correctly. also consult past lessons to make sure syntax is ok for nokogiri call