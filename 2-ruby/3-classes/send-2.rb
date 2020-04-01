class Guitar
    def initialize brand
        @brand = brand
    end
    def text
        puts "I am #{a_or_an(@brand)} #{@brand}"
    end
    def a_or_an next_word
        case ["a","e","o","u","i"].include? next_word[0].downcase
        when true
            "an"
        else
            "a"
        end
    end

end

ibz = Guitar.new("Ibanez")
ibz.text

puts ibz.object_id

receiver = Guitar

receiver.send(:new, "Fender")
receiver.send(:new, "Fender").text
