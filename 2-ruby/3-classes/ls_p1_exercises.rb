require "time"
class Vehicle
    @@number_of_vehicles = 0
    attr_accessor :year, :color, :model
    def initialize(y,c,m)
        @year = y
        @color = c
        @model = m
        @speed = 0
        puts "A new #{color} #{model}(#{year}) created."
        @@number_of_vehicles += 1
        @time_creation = Time.now
    end
    def speed_up(speed = acceleration)
        @speed += speed
        @speed = top_speed if @speed > top_speed
        ">>>#{model} accelerated, going with #{@speed} km/h."
    end
    def brake(brake = braking)
        @speed -= brake
        turn_off if @speed < 0
        "#{color} #{model} slowed, going with #{@speed} km/h.<<<"
    end
    def turn_off
        return "#{model} is already stopping!" if @speed == 0
        @speed = 0
        "|#{model} stopped.|"
    end
    def spray_paint(color)
        self.color = color
        "***#{model} repainted really nice! Now it is shining #{@color}!!***"
    end
    def self.gas_mileage(liters, kilometers)
        puts "#{kilometers / liters} kilometers per liter of fuel."
    end
    def get_id
        id_number
    end
    def self.how_many
        "Total Vehicles Created: #{@@number_of_vehicles}"
    end
    def how_old
        "#{year} model #{color} #{model} " + age.ceil.to_s + " years old."
    end
    private
    def id_number
        1239
    end
    def age
        (Time.now.year - year.to_i)
    end
end
module CarTires
    NUMBER_OF_TIRES = 4
end
class MyCar < Vehicle
    NUMBER_OF_DOORS = 4
    include CarTires
    def acceleration
        50
    end
    def top_speed
        232
    end
    def braking
        11
    end
    def how_many_tires
        "This car has #{NUMBER_OF_TIRES} tires."
    end
end
class MyTruck < Vehicle
    NUMBER_OF_DOORS = 2
    def acceleration
        12
    end
    def top_speed
        132
    end
    def braking
        35
    end
end
def test_cars
    mazda = MyCar.new("2008", "Blue", "Mazda RX-8")
    puts mazda.speed_up
    puts mazda.brake
    puts mazda.turn_off
    puts mazda.year
    puts mazda.color
    puts mazda.spray_paint("Red")
    puts mazda.color
    puts mazda.speed_up(250)
    puts mazda.brake(50)
    MyCar.gas_mileage(6, 100)
    puts mazda.get_id
    puts mazda.how_many_tires
    puts mazda.instance_of? MyCar

    swedish = MyTruck.new("2018", "White", "Scania")
    puts swedish.speed_up(150)
    puts swedish.brake
    puts swedish.spray_paint("Silver Gray")
    puts Vehicle.how_many

    puts "Vehicle method lookup: #{Vehicle.ancestors}"
    puts "MyCar method lookup  : #{MyCar.ancestors}"
    puts "MyTruck method lookup: #{MyTruck.ancestors}"

    puts mazda.how_old
    puts swedish.how_old
end
#test_cars

class Student
    attr_accessor :name
    def initialize(name, grade)
        @name = name
        @grade = grade
    end
    def better_grade_then? st2
        grade > st2.grade
    end
    protected
    attr_reader :grade
end

joe = Student.new("joe", 90)
bob = Student.new("bob", 9)
puts joe.name

puts joe.better_grade_then? bob