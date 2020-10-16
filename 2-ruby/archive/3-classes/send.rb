def question(question, answer = nil)
  puts question
  answer = if answer
             gets.chomp
           else
             answer
           end
end

puts 'I need a receiver(1) a method(2) and a parameter(3) please...'
receiver = question('Recevier(1) please:', 5).to_i
puts receiver.class
method = question('Method(2) please:', :+).to_sym
puts method.class
parameter = question('Parameter(3) please:', 3).to_i
puts parameter.class

puts receiver.send(method, parameter)
