class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :transfers, [:user_id, :created_at]
  end
end
