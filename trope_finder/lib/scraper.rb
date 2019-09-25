require 'pry'
require 'open-uri'
require 'nokogiri'
require_relative './trope.rb'

class Scraper
  
  def trope_list(url)
    trope_html = Nokogiri::HTML(open(url))
    trope_index = trope_html.css("div.article-content.retro-folders ul")[1].children
    trope_index.each do |trope|
      url = trope.css('a')
      trope_address = (url.map {|element| element["href"]}.compact)
      trope_url = "https://tvtropes.org" + trope_address[0].to_s
      text = trope.text
      divide = text.split(":")
      trope_name = divide[0]
      Trope.new(trope_name, trope_url) unless trope_name == "Advertisement"
    end
  end
  
  def trope_page(trope)
    trope_url = trope.url
    page_html = Nokogiri::HTML(open(trope_url))
    if page_html.css("div.indent")[0] == nil
      trope.quote = ""
    else
      trope.quote = page_html.css("div.indent")[0].text + "\n \n"
    end
    trope.description = page_html.css("div.article-content.retro-folders p").text
  end
  
end


#trope name: page_html.css("h1.entry-title").text.gsub("/n", "")
#trope page quote: page_html.css("div.indent")[0].text
#trope description: page_html.css("div.article-content.retro-folders p").text