class Category < ApplicationRecord
  validates :description, presence: true, uniqueness: true
end
