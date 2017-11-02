class CreateHandles < ActiveRecord::Migration[5.1]
  def change
    create_table :handles do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
