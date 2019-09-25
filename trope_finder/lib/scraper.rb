require 'pry'
require 'open-uri'
require 'nokogiri'
require_relative './trope.rb'

class Mod::Scraper
  
  def trope_list(url)
    trope_html = Nokogiri::HTML(open(url))
    trope_index = trope_html.css("div.article-content.retro-folders ul")[1].children
    trope_index.each do |trope|
      url = trope.css('a')
      trope_url = url.map {|element| element["href"]}.compact
      text = trope.text
      divide = text.split(":")
      trope_name = divide[0]
      Mod::Trope.new(trope_name, trope_url)
    end
  end
  
  def trope_page(trope_url)
    page_html = Nokogiri::HTML(open(trope_url))
    trope = Trope.all[input - 1]
    trope_page(trope)
    trope.name = page_html.css("h1.entry-title").text.gsub("/n", "")
    trope.quote = page_html.css("div.indent")[0].text
    trope.description = page_html.css("div.article-content.retro-folders p").text
  end
  
end

#trope name: page_html.css("h1.entry-title").text.gsub("/n", "")
#trope page quote: page_html.css("div.indent")[0].text
#trope description: page_html.css("div.article-content.retro-folders p").text