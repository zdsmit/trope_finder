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
      puts "Enter a number to learn more about that trope."
      input = STDIN.gets.strip
      trope_info = @index.trope_list(@url)[input.to_i - 1].children.map {|info| info["href"]}
      page_address = "tvtropes.org" + (trope_info[1].to_s)
      @index.trope_page(page_address)
    elsif answer == "n"
      puts "Thank you for using the Trope Finder. Please have a great day."
    end
  end
  
  TropeFinder.new.user_interface
  
  # note 9/23: almost working, but before it can complete its functionality it returns the error "No such file or directory @ rb_sysopen - tvtropes.org/pmwiki/pmwiki.php/Main/ZanySchemeChicken (Errno::ENOENT)"
  
end