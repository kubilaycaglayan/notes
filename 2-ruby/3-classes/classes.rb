require './modules.rb'

class Musicians
  def initialize(name, instrument)
    @name = name
    @instrument = instrument
  end

  def story
    puts "#{@name} plays #{@instrument.downcase}. He/She is from #{@from} and currently active in #{region}."
    special_story
  end
  attr_accessor :region
  attr_accessor :from
end

class Guitarists < Musicians
  extend InfoGuitarist
  extend InfoGuitar
  include Favourites
  def initialize(name)
    @name = name
    @instrument = 'guitar'
  end

  def special_story
    puts "His/Her favourite guitar is #{favourite_guitar} and favourite pick is #{if favourite_pick == favourite_guitar
                                                                                    'also '
                                                                                      end}#{favourite_pick}."
  end
end

satriani = Guitarists.new('Joe Satriani')
satriani.favourite_guitar = 'Ibanez'
satriani.favourite_pick = 'Planet Waves'
satriani.region = 'USA'
satriani.from = 'Italy'
satriani.story
puts '--'

srv = Guitarists.new('Steve Ray Vaughan')
srv.favourite_guitar = 'Fender'
srv.favourite_pick = 'Fender'
srv.region = 'USA'
srv.from = 'Texas'
srv.story
puts '--This is coming from module :'
Guitarists.guitar_info
Guitarists.guitarist_info
puts '--And this is the ANCESTORS'
p Guitarists.ancestors
