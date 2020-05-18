class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :direction, null: false, default: 10
      t.integer :operability, null: false, default: 10
      t.integer :story, null: false, default: 10
      t.integer :volume, null: false, default: 10
      t.integer :like, null: false, default: 10
      t.string :summary
      t.text :body
      t.integer :game_id
      t.integer :user_id
            
      t.timestamps
    end
  end
end
