class HandleType < ApplicationRecord
  has_many :handles

  validates :name, presence: true
end
