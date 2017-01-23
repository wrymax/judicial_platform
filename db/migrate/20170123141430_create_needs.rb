class CreateNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :needs do |t|
      t.integer :user_id
      t.text :content
      t.string :status, default: 'pending'
      t.integer :operator_id
      t.text :notes

      t.timestamps
    end

    add_index :needs, :user_id
    add_index :needs, :status
  end
end
