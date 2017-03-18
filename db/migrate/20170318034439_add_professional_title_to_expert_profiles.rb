class AddProfessionalTitleToExpertProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :expert_profiles, :professional_title, :string
  end
end
