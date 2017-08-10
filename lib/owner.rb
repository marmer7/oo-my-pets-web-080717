require "pry"

class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@All = Array.new

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {fishes: [], dogs: [], cats: []}
    @@All << self
    # binding.pry
  end

  def self.all
    @@All
  end

  def self.reset_all
    @@All.clear
  end

  def self.count
    @@All.size
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |species, animals|
      animals.each do |animal|
        animal.mood = "nervous"
      end
      animals.clear
    end
  end

  def list_pets
    "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end
end
