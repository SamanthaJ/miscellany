class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_type
      t.integer :priority
      t.string :duration_in_minutes
      t.boolean :complete
      t.boolean :optimal
      t.integer :user_id

      t.timestamps
    end
  end
end
