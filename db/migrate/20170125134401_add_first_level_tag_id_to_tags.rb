class AddFirstLevelTagIdToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :first_level_tag_id, :integer
    add_index :tags, :first_level_tag_id
  end
end
