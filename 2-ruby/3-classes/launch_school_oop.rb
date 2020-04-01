class GoodDog
    attr_accessor :name, :height, :weight
    @@count_speak = 1
    def initialize (n, h, w)
        @name = n
        @height = h
        @weight = w
    end
    def change_info (n, h, w)
        self.name = n
        self.height = h
        self.weight = w
    end
    def info
        "#{name} weighs #{weight} and is #{height} tall."
    end
    def speak
        puts "#{name} says #{"Arf!" * @@count_speak}" 
        @@count_speak += 1
    end

end

fido = GoodDog.new("Fido", "15kg", "80cm")
sparky = GoodDog.new("Sparky", "11kg", "60cm")

fido.speak
sparky.speak
sparky.name = "Spartacus"
puts sparky.name
puts fido.info
fido.change_info("Frodo", "5kg", "55cm")
puts fido.info
