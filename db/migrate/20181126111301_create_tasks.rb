class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content
      t.datetime :end_time
      t.integer :priority
      t.string :state
      t.integer :user_id

      t.timestamps
    end
  end
end
