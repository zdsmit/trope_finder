class TropeFinder
  attr_accessor :index, :url
  
  def initialize(trope_url="https://tvtropes.org/pmwiki/pmwiki.php/Main/Plots")
    @index = Scraper.new
    @url = trope_url
  end
  
  def user_interface
    @index.trope_list(@url)
    loop do
      puts "Welcome to the trope index! Whether you're a big fan of TV, books, movies, or something else, you have definitely seen a great variety of tropes and cliches. This will allow you to have some fun exploring them!"
      puts "You can get more information about your favorite tropes here. Would you like to see a list of tropes? [y/n]:"
      answer = gets.strip
      answer = answer.to_s
      if answer == "y"
        Trope.all.each_with_index do |trope, number|
          number += 1
          puts "#{number}. #{trope.name}"
        end
        puts "Enter a number to learn more about that trope."
        input = gets.strip
        if input.to_i > 1 && input.to_i < 750
          trope = Trope.all[input.to_i - 1]
          @index.trope_page(trope)
          puts "#{trope.name} \n \n #{trope.quote} #{trope.description} \n \n"
        else
          puts "Sorry, I didn't understand that. Please enter a number between 1-750."
        end
      elsif answer == "n"
        puts "Thank you for using the Trope Finder. Please have a great day."
        break
      else
        puts "Sorry, I didn't understand that. Please enter y or n \n"
      end
      binding.pry
    end
  end
  
end
  
  # note 9/23: almost working, but before it can complete its functionality it returns the error "No such file or directory @ rb_sysopen - tvtropes.org/pmwiki/pmwiki.php/Main/ZanySchemeChicken (Errno::ENOENT)"
