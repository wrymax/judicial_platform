class CreateJudicialCases < ActiveRecord::Migration[5.0]
  def change
    create_table :judicial_cases do |t|
      t.text :content

      t.timestamps
    end
  end
end
