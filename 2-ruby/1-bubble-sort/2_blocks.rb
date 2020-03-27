def printing
  puts 'Hey first line'
  print 'Diving to yield'
  3.times do
    sleep 0.1
    print '.'
  end
  puts
  yield('Kubilay', 'Çağlayan')
  puts 'Hey we are finishing the method here.'
end

printing do |name, surname|
  puts '______'
  puts '>>> I am in yield'
  puts "My name is #{name}, surname is #{surname}."
  puts '______'
  sleep 0.5
end
