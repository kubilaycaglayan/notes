# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = %w[Kubilay Tayo Berry Dennis]

names.each do |name|
  User.create(name: name)
end

Friendship.create(user_id: 2, friend_id: 1)
Friendship.create(user_id: 2, friend_id: 3, confirmed: true)
Friendship.create(user_id: 2, friend_id: 4, confirmed: true)

Friendship.create(user_id: 1, friend_id: 2, confirmed: true)
Friendship.create(user_id: 1, friend_id: 3)
Friendship.create(user_id: 1, friend_id: 4, confirmed: true)
