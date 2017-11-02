class AddHandleTypeToHandle < ActiveRecord::Migration[5.1]
  def change
    add_reference :handles, :handle_type, foreign_key: true
  end
end
