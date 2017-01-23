class CreateWorkDynamics < ActiveRecord::Migration[5.0]
  def change
    create_table :work_dynamics do |t|
      t.text :content

      t.timestamps
    end
  end
end
