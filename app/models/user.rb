class User < ApplicationRecord
  has_many :handles
  has_many :connections
end
