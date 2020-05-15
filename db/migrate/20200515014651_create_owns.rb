class CreateOwns < ActiveRecord::Migration[5.2]
  def change
    create_table :owns do |t|
      
      t.timestamps
    end
  end
end
