class AddTitleToNeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :needs, :title, :string
  end
end
