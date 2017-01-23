class CreateNeedExperts < ActiveRecord::Migration[5.0]
  def change
    create_table :need_experts do |t|
      t.integer :user_id
      t.integer :need_id

      t.timestamps
    end

    add_index :need_experts, [:user_id, :need_id]
    add_index :need_experts, :need_id
  end
end
