class CreateSkiResorts < ActiveRecord::Migration[6.1]
  def change
    create_table :ski_resorts do |t|
      t.integer :prefecture_id, null: false
      t.string :name,           null: false
      t.text :introduction,     null: false
      t.string :address,        null: false

      t.timestamps
    end
  end
end
