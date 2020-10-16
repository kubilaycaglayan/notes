year = 1851

kind = 
  case year
  when 1850..1889 then 'Blues'
  when 1890..1909 then 'Ragtime'
  when 1910..1929 then 'New Orleans Jazz'
  when 1930..1939 then 'Swing'
  when 1940..1950 then 'Bebop'
  else 'Jazz'
  end

puts kind * 5

result = 
  if year > 1850
    "Hell yeah!"
  else
    "Daamn!"
  end

puts result

p (1..5).to_a
.to_s

p "Started to make a " \
  "sentence"

def mail_sender
  def send(
    address: "Bağlıca",
    name: "Kubilay"
    )
    puts :address
  end
  send
end
mail_sender