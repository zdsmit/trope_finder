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

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
  
end