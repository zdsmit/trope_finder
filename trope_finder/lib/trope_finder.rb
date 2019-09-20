require_relative './scraper.rb'

class TropeFinder
  attr_accessor :index, :url
  
  def initialize(trope_url="https://tvtropes.org/pmwiki/pmwiki.php/Main/Plots")
    @index = Scraper.new
    @url = trope_url
  end
  
  def user_interface
    puts "Welcome to your trope index! Whether you're a big fan of TV, books, movies, or something else, you have definitely seen a great variety of tropes and cliches. This will allow you to have some fun exploring them!"
    puts "Below you will find a list of tropes. Pick one by number to get more information about it!"
    @index.trope_list(@url)
    input = gets.strip
    @index.trope_list(@url).detect do |trope_entry|
      if trope_entry.include?(input)
        puts trope_entry
      end
    end
  end
  
  # note 9/20: the user_interface isn't working yet. it needs to identify the number of the trope from the list and return that entry based on user input. also, may want to consider changing welcome message setup due to large size of trope list
  
end