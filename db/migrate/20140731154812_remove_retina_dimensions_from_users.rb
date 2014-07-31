class RemoveRetinaDimensionsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :retina_dimensions
  end
end
