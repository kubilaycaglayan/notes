class MyCar
    attr_accessor :year, :color, :model
    def initialize(y,c,m)
        @year = y
        @color = c
        @model = m
        @speed = 0
        puts "A new #{color} #{model}(#{year}) created."
    end
    def speed_up(speed = 10)
        @speed += speed
        @speed = 203 if @speed > 203
        "#{model} accelerated, going with #{@speed} km/h."
    end
    def brake(brake = 10)
        @speed -= brake
        turn_off if @speed < 0
        "#{color} #{model} slowed, going with #{@speed} km/h."
    end
    def turn_off
        return "#{model} is already stopping!" if @speed == 0
        @speed = 0
        "Mazda stopped."
    end
    def spray_paint(color)
        self.color = color
        "#{model} repainted really nice! Now it is shining #{@color}!!"
    end
    def self.gas_mileage(liters, kilometers)
        puts "#{kilometers / liters} kilometers per liter of fuel."
    end
end

mazda = MyCar.new("2008", "Blue", "Mazda RX-8")
puts mazda.speed_up(50)
puts mazda.brake(30)
puts mazda.turn_off
puts mazda.year
puts mazda.color
puts mazda.spray_paint("Red")
puts mazda.color
puts mazda.speed_up(250)
puts mazda.brake(50)
MyCar.gas_mileage(6, 100)