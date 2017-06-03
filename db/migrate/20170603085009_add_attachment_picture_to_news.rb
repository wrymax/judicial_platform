class AddAttachmentPictureToNews < ActiveRecord::Migration
  def self.up
    change_table :news do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :news, :picture
  end
end
