class Category < ApplicationRecord
  validates :code, uniqueness:true
  validates :description, presence: true, uniqueness: true
end
