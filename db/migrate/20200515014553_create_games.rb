class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :company, null: false
      t.integer :genre, null: false
      t.integer :price, null: false, default: 5000
      t.date :released_at
      t.text :story
      t.text :icon

      t.timestamps
    end
  end
end
