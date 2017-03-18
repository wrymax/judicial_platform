class AddProfessionalTitleToExpertApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :expert_applications, :professional_title, :string
  end
end
