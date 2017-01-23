class CreateExpertApplies < ActiveRecord::Migration[5.0]
  def change
    create_table :expert_applies do |t|
      t.string :license_no

      t.timestamps
    end
  end
end
