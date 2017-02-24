class AddStatusToExpertApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :expert_applications, :status, :string, default: :pending
  end
end
