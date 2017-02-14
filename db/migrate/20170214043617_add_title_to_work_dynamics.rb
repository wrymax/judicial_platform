class AddTitleToWorkDynamics < ActiveRecord::Migration[5.0]
  def change
    add_column :work_dynamics, :title, :string
  end
end
