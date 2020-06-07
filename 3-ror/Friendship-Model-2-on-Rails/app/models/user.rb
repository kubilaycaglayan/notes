class User < ApplicationRecord
  has_many :confirmed_friendships, -> { confirmed }, class_name: 'Friendship'
  has_many :friends, source: :friend, through: :confirmed_friendships
end
