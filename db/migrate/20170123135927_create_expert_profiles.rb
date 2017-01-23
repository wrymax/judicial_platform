class CreateExpertProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :expert_profiles do |t|
      t.integer :user_id
      t.string :license_no

      t.timestamps
    end
  end
end
