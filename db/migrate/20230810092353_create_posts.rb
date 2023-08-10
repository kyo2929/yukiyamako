class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id,   null: false
      t.integer :ski_resort_id, null: false
      t.text :body,             null: false
      t.string :star,           null: false

      t.timestamps
    end
  end
end
