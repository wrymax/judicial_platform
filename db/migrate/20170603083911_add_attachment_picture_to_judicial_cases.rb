class AddAttachmentPictureToJudicialCases < ActiveRecord::Migration
  def self.up
    change_table :judicial_cases do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :judicial_cases, :picture
  end
end
