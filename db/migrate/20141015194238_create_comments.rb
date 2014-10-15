class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :user_name
      t.text :body

      t.timestamps
    end
  end
end
