class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :user_type, :string, default: 'demander'
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :phone, :string
    add_column :users, :pitch, :string
    add_column :users, :resume, :text
  end
end
