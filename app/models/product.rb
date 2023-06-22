class Product < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
end
