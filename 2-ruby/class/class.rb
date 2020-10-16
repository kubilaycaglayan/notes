require 'byebug'

class Kubilay
  attr_reader :me
  def initialize
    @me = 12
  end
  def kubi
    puts 'hey'
  end
end

def my_method

end

insta = Kubilay.new
byebug
puts