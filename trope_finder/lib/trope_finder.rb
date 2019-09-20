class TropeFinder
  attr_accessor :index
  
  def initialize(trope_url="https://tvtropes.org/pmwiki/pmwiki.php/Main/Plots")
    @index = Scraper.new
  end
  
  def user_interface
  end
  
end