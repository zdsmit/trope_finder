require_relative './scraper.rb'

class TropeFinder
  attr_accessor :index, :url
  
  def initialize(trope_url="https://tvtropes.org/pmwiki/pmwiki.php/Main/Plots")
    @index = Scraper.new
    @url = trope_url
  end
  
  def user_interface
    puts "Welcome to the trope index! Whether you're a big fan of TV, books, movies, or something else, you have definitely seen a great variety of tropes and cliches. This will allow you to have some fun exploring them!"
    puts "You can get more information about your favorite tropes here. Would you like to see a list of tropes? [y/n]:"
    answer = gets.strip
    answer = answer.to_s
    if answer == "y"
      @index.trope_list(@url)
      input = gets.strip
      @index.trope_list(@url).detect do |trope_entry|
        if trope_entry.include?(input)
          puts trope_entry
        end
      end
    elsif answer == "n"
      puts "Thank you for using the Trope Finder. Please have a great day."
    end
  end
  
  TropeFinder.new.user_interface
  
  # note 9/20: the user_interface isn't working yet. it needs to identify the number of the trope from the list and return that entry based on user input. also, may want to consider changing welcome message setup due to large size of trope list
  
end