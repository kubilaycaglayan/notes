class Friendship < ApplicationRecord
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  scope :confirmed, -> { where(confirmed: true) }
end
