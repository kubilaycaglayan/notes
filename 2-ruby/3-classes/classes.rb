class Musicians
    def initialize(name, instrument)
        @name = name
        @instrument = instrument
    end
    def story
        puts "#{@name} plays #{@instrument.downcase}. He/She is from #{@from} and currently active in #{region}."
        self.special_story
    end
    attr_accessor :region
    attr_accessor :from
end

class Guitarists < Musicians
    def initialize(name)
        @name = name
        @instrument = "guitar"
    end
    def special_story
        puts "His/Her favourite guitar is #{favourite_guitar} and favourite pick is #{"also " if favourite_pick == favourite_guitar}#{favourite_pick}."
    end
    attr_accessor :favourite_pick
    attr_accessor :favourite_guitar
end

satriani = Guitarists.new("Joe Satriani")
satriani.favourite_guitar=("Ibanez")
satriani.favourite_pick=("Planet Waves")
satriani.region=("USA")
satriani.from=("Italy")
satriani.story
puts "--"

srv = Guitarists.new("Steve Ray Vaughan")
srv.favourite_guitar=("Fender")
srv.favourite_pick=("Fender")
srv.region=("USA")
srv.from=("Texas")
srv.story
