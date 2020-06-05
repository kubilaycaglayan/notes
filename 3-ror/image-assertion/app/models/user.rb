class User < ApplicationRecord
  has_many :photos, inverse_of: :user
  accepts_nested_attributes_for :photos
end
