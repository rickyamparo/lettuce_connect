class User < ApplicationRecord
  has_many :handles
  has_many :connections

  validates :first_name, :last_name, :password, presence:  true
  validates :email, presence: true, uniqueness: true
end
