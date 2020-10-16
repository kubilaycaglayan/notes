puts Math::PI
require 'date'
puts Date.today

module MeMyself
  MY_AGE = 28
end

puts "Before including: #{MeMyself::MY_AGE}"

include MeMyself

puts "After including : #{MY_AGE}"

module InfoGuitarist
  def guitarist_info
    puts 'Guitarist plays guitar.'
  end
end

module InfoGuitar
  def guitar_info
    puts 'Guitars are instruments with 6 strings.'
  end
end

module Favourites
  attr_accessor :favourite_pick
  attr_accessor :favourite_guitar
end
