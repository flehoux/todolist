class CreatePartnerships < ActiveRecord::Migration
  def change
    create_table :partnerships do |t|
      t.integer :user_id
      t.integer :project_id
      t.boolean :owner, default: false

      t.timestamps
    end
  end
end
