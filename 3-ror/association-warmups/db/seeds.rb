# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

people = ["Kubilay", "Marios", "John", "Jack", "Sully"]
pets = ["Dog", "Cat", "Lion", "Cheetah", "Puma", "Jaguar"]
parties = ["Bachelor Party", "Graduation", "Cup Win"]

people.each do |person|
  Person.create(name: person)
  User.create(name: person)
end

pets.each do |pet|
  Pet.create(name: pet)
end

Pet.all.each do |pet|
  Friend.create(pet_id: pet.id, person_id: Person.first.id)
end

Person.all.each do |person|
  Friend.create(pet_id: 1, person_id: person.id)
end

parties.each do |party|
  Party.create(title: party, user_id: 1)
end

Party.all.each do |party|
  User.all.each do |user|
    next if party.id == 1
    Invitation.create(party_id: party.id, user_id: user.id, joining: false) unless user.id == party.user_id || party.id == 1
  end
end

User.all.each do |user|
  Following.create(follower_id: user.id, followed_id: 1) unless user.id == 1
end

Post.create(title: "Life in Mars", body: "Scientists found life in mars!", user_id: 1)