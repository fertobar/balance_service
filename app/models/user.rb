class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable,:registerable, :lockable, :timeoutable  and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :role, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  enum role: { admin: 1, regular: 0 }
end
