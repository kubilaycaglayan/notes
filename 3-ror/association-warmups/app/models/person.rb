class Person < ApplicationRecord
	has_many :pets, through: :friends
	has_many :friends
end
