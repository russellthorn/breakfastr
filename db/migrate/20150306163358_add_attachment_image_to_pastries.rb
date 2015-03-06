class AddAttachmentImageToPastries < ActiveRecord::Migration
  def self.up
    change_table :pastries do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pastries, :image
  end
end
