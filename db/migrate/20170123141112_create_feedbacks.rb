class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.text :content
      t.text :reply
      t.integer :operator_id

      t.timestamps
    end
  end
end
