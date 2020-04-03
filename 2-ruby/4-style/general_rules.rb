at_exit { puts "\nGoodbye!" }
a = 'a'
b = 'b'

change = true

a = 'changed' if change

puts a

change && a = 'changed again'

puts a

save_the_kid = false

save_the_kid || (puts 'This is so bad!')

(1..8).each do |n|
  next unless n > 3
  print n
end

puts
  
def multi_return
  [3,5]
end

first, second = multi_return

puts first, second

first, *list = (1..6).to_a

puts first
print list

puts

name ||= 'Bozhidar'

puts name

[1,2,3].each { |item| puts item } # use {} 

puts "--"

puts [[1, 2, 3], [4, 5, 6]].map { |a,| a }

puts "Lambda"
l = ->(a, b) { a + b }
l = ->(a, b) { a + b }

puts l.call(1, 2)

puts "Proc"

p = proc { |given| puts "I am a Proc!" + given.to_s }
p.call(123)

puts "--"
puts "Ideal METHODS".upcase
def example
  puts "They say every method"
  puts "should be ideally"
  puts "between 5 lines"
  puts "to 10 lines."
  puts "In other words"
  puts "5 LOC to 10 LOC"
end
example
puts "--"

def single_line_methods() puts "look at this beauty" end
single_line_methods

def no_op; end
no_op

puts "bu aşamada fonksiyon yazma alışkanlığımızı değiştiriyoruz çünkü meğer parametre parantezi kullanmak iyi uygulama örneğiymiş"

def my_method(param1, param2)
  puts param1
  puts param2
end

my_method(
  'Aynı şekilde fonskiyonu çağırırkende',
  'aynı kurallara dikkat edelim.'
  )

puts "Keyword Argumenting"

def my_precious(a: 1)
  puts a
end
my_precious()

class Person
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end

me = Person.new('Kubilay', 'Çağlayan')

puts me

words = %w[you me and myself]
puts words.first

flowers = {
  daisy: "red",
  rose: "pink"
}

puts flowers

puts flowers.key?(:daisy)
puts flowers.key?(:d)

puts flowers.fetch(:daisy)
p flowers.values_at(:daisy, :rose)
data1, data2 = flowers.values_at(:daisy, :rose)
puts data1, data2

flowers.transform_values! { |value| value * 2 }
puts flowers

(1..10).reverse_each { |x| puts x }

puts rand(1.2..1.5).round(2)

puts 3e6.to_i

puts format('%s <%s>', "asd", "bcg")

my_day = <<-DAY
My day started really fine.
  I am happy.
DAY

puts my_day

require 'time'

puts Time.now

text = 'This is a sunny day.'

p text['This']

a = [1, 2, 3].reduce({}) { |h, i| h[i] = i * 17; h }  

puts a 