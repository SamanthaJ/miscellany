class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.text :question
      t.text :answer
      t.integer :user_id

      t.timestamps
    end
  end
end
