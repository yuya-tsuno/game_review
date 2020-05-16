class CreateOwns < ActiveRecord::Migration[5.2]
  def change
    create_table :owns do |t|
      t.integer :game_id, null: false
      t.integer :user_id, null: false   
      
      t.timestamps
    end
  end
end
