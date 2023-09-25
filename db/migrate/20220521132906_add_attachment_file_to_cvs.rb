class AddAttachmentFileToCvs < ActiveRecord::Migration[5.0]
  def self.up
    change_table :cvs do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :cvs, :file
  end
end
