class RemoveCreatedAtFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :createdAt, :updatedAt
  end
end
