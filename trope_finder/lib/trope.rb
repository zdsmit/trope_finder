class Trope
  attr_accessor :name, :description, :quote, :url
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @description = description
    @quote = quote
    @@all << self
  end
  
  def self.find_trope_by_word(key_word)
    Trope.all.select {|trope|
      trope.name if trope.name.include?(key_word)
    }
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
  
end