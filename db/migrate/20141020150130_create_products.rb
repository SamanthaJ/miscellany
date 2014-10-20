class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :image_url
      t.integer :stock
      t.integer :user_id

      t.timestamps
    end
  end
end
