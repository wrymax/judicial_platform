class CreateCaseExperts < ActiveRecord::Migration[5.0]
  def change
    create_table :case_experts do |t|
      t.integer :user_id
      t.integer :judicial_case_id

      t.timestamps
    end

    add_index :case_experts, [:user_id, :judicial_case_id]
    add_index :case_experts, [:judicial_case_id]
  end
end
