# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.create(name: "Dostoyevski", masterpiece: "Crime and Punishment")
Author.create(name: "Jack London", masterpiece: "The Call of The Wild")

Book.create(title: "Crime and Punishment", author_id: 1)
Book.create(title: "White Nights", author_id: 1)