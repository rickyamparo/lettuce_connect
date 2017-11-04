class Connection < ApplicationRecord
  belongs_to :user

  validates :scanned_id, presence: true 
  # def scanned_handles
  #   Handle.where(user_id: self.scanned_id)
  # end

  def scanned_user
    User.find(self.scanned_id)
  end

  def github_handle
    Handle.find_by(user_id: self.scanned_id, handle_type_id: 1)
  end

  def twitter_handle
    Handle.find_by(user_id: self.scanned_id, handle_type_id: 2)
  end

  def linkedin_handle
    Handle.find_by(user_id: self.scanned_id, handle_type_id: 3)
  end

end
