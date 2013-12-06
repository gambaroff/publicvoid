class RemoveContentFromTransfers < ActiveRecord::Migration
  def change
    remove_column :transfers, :content, :string
  end
end
