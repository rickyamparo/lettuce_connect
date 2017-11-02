class AddUserToHandle < ActiveRecord::Migration[5.1]
  def change
    add_reference :handles, :user, foreign_key: true, index: true
  end
end
