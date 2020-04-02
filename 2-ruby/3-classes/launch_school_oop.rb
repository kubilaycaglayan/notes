class GoodDog
  attr_accessor :name, :height, :weight
  @@count_speak = 1
  @@number_of_dogs = 0
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
    @@number_of_dogs += 1
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end

  def speak
    puts "#{name} says #{'Arf!' * @@count_speak}"
    @@count_speak += 1
  end

  def self.how_many_dogs
    "There are #{@@number_of_dogs} dogs in our class."
  end

  def to_s
    "This dog is #{name} weighs #{weight} and is #{height} tall."
  end
  puts self
end

fido = GoodDog.new('Fido', '15kg', '80cm')
sparky = GoodDog.new('Sparky', '11kg', '60cm')

fido.speak
sparky.speak
sparky.name = 'Spartacus'
puts sparky.name
puts fido.info
fido.change_info('Frodo', '5kg', '55cm')
puts fido.info
puts GoodDog.how_many_dogs
puts fido
p fido
print fido
puts
arr = [1, 2, 3]

puts "selam #{fido}"
