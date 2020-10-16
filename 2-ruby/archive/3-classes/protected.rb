module NoPrivacy
  attr_reader :num
end

module Protected
  protected
  attr_reader :num
end

module Privated
  private
  attr_reader :num
end

class MyNumbers_1
  include NoPrivacy
    def initialize(num)
        @num = num
    end
    def add_up(recipient)
        @num + recipient.num
    end
end
class MyNumbers_2
  include Protected
    def initialize(num)
        @num = num
    end
    def add_up(recipient)
        @num + recipient.num
    end
end
class MyNumbers_3
  include Privated
  def initialize(num)
      @num = num
  end
  def add_up(recipient)
      @num + recipient.num
  end
end

def test_privacy
  titles = ["____no_privacy", "____protected", "____private"]
  classes = ["MyNumbers_1", "MyNumbers_2", "MyNumbers_3"]
  titles.size.times do |i|
    puts titles[i].upcase
    begin
      my_five = eval(classes[i]).new(5)
      my_nine = eval(classes[i]).new(9)
      print "adding function: " 
      print my_five.add_up(my_nine)
      puts
    rescue => exception
      puts exception
    end
    begin
      print "calling my_five.num: "
      print my_five.num
      puts
    rescue => exception
      puts exception
    end
    begin
      print "calling my_nine.num: "
      print my_nine.num
      puts
    rescue => exception
      puts exception
    end
  end
end
test_privacy