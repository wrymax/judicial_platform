class AddNameToJudicialCases < ActiveRecord::Migration[5.0]
  def change
    add_column :judicial_cases, :name, :string
  end
end
