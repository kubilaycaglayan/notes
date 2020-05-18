# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

people = ["Kubilay", "Marios", "John", "Jack", "Sully"]
pets = ["Dog", "Cat", "Lion", "Cheetah", "Puma", "Jaguar"]

people.each do |person|
  Person.create(name: person)
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