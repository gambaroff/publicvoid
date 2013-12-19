class CreateAssetTransfers < ActiveRecord::Migration
  def change
    create_table :asset_transfers do |t|
      t.integer :user_id, null: false
      t.string :direct_upload_url, null: false
      t.attachment :upload
      t.boolean :processed, default: false, null: false
      t.timestamps
    end
    add_index :asset_transfers, :user_id
    add_index :asset_transfers, :processed
  end
end
