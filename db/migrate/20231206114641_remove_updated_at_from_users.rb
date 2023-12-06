class RemoveUpdatedAtFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :updatedAt
  end
end
