class Invitation < ApplicationRecord
	belongs_to :party
	belongs_to :user
end
