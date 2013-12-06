class AddAttachmentUploadedFileToTransfers < ActiveRecord::Migration
  def self.up
    change_table :transfers do |t|
      t.attachment :transfered_file
    end
  end
  
  def self.down
    drop_attached_file :transfers, :transfered_file
  end
end

