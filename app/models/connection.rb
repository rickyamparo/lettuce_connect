class Connection < ApplicationRecord
  belongs_to :user

  validates :scanned_id, presence: true

  def scanned_user
    User.find(self.scanned_id)
  end

  def github_handle
    handle = Handle.find_by(user_id: self.scanned_id, handle_type_id: 1)
    if handle.nil?
      Handle.new
    else
      handle
    end
  end

  def twitter_handle
    handle = Handle.find_by(user_id: self.scanned_id, handle_type_id: 2)
    if handle.nil?
      Handle.new
    else
      handle
    end
  end

  def linkedin_handle
    Handle.find_by(user_id: self.scanned_id, handle_type_id: 3)
  end

end
