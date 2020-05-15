class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :company
      t.integer :genre
      t.integer :price
      t.date :released_at
      t.text :story
      t.text :icon

      t.timestamps
    end
  end
end
