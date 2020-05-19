class Pet < ApplicationRecord
	has_many :people, through: :friends
	has_many :friends
end
