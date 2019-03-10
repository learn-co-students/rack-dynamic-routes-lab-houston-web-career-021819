class Item
  attr_accessor :name, :price
  @@all = []

  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end
  # 
  # def self.find (test)
  #   counter = 0
  #   Item.all.each do |item|
  #     binding.pry
  #     if item.name == test
  #       binding.pry
  #       return counter
  #       break
  #     else
  #       counter += 1
  #     end
  #   end
  # end

  def self.all
    @@all
  end
end
