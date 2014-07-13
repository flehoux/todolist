class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link
      t.integer :task_id

      t.timestamps
    end
  end
end
