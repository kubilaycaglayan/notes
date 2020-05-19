class Phone < ApplicationRecord
  validates :number, :person_id, presence: true
  belongs_to :person
end
