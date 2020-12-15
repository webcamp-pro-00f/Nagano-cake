class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :category_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :image_id, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
