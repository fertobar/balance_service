class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :role, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  enum role: { admin: 1, regular: 0 }
end
