def how_many_flowers(name)
  flowers = ['dandelion', 'sunflower', 'cactuse', 'oak',
             'tulip', 'daffodil', 'rose', 'cherry blossom',
             'orchids', 'daisy', 'iris']
  print "Hello #{name}! \nYou have... "
  print yield(8, flowers)
  puts 'Do you want to water them?'
end
flower_picker = lambda do |range, flowers|
  you_have = "#{rand((1..range))} pieces of #{flowers[rand(flowers.length)].capitalize}... That's great!\n"
  return you_have
end
how_many_flowers('Kubilay', &flower_picker)
