class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :post_counter
      t.datetime :createdAt
      t.datetime :updatedAt

      t.timestamps
    end
  end
end
