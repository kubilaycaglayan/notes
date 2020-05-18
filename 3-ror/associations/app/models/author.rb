class Author < ApplicationRecord
  has_many :books
  # Bi-directional associations 3.5
end
