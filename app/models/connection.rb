class Connection < ApplicationRecord
  belongs_to :user

  def scanned_handles
    Handle.where(user_id: self.scanned_id)
  end

end
