class Owner
  attr_reader :name, :species

  @@all = []

  def initialize (name)
    @name = name
    @species = "human"

    @@all << self
  end

  def say_species 
    "I am a #{species}."
  end

  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat (name)
    Cat.new(name, self)
  end

  def buy_dog (name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.walk}
  end

  def feed_cats
    cats.each {|cat| cat.feed_me}
  end

  def sell_pets
    cats.each do |cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    end
      dogs.each do |dog| 
        dog.mood = "nervous" 
        dog.owner = nil
      end
  end 

  def list_pets
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end 

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

end