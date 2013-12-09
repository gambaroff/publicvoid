class AddAttachmentUploadedFileToTransfers < ActiveRecord::Migration
  def self.up
    change_table :transfers do |t|
      t.attachment :transferred_file
    end
  end
  
  def self.down
    drop_attached_file :transfers, :transferred_file
  end
end

