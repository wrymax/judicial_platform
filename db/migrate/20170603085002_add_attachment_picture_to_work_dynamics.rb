class AddAttachmentPictureToWorkDynamics < ActiveRecord::Migration
  def self.up
    change_table :work_dynamics do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :work_dynamics, :picture
  end
end
