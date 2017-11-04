class Handle < ApplicationRecord
  belongs_to :user
  belongs_to :handle_type

  validates :name, presence: true
end
