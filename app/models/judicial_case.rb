class JudicialCase < ApplicationRecord
  has_many :case_experts, dependent: :destroy
  has_many :experts, through: :case_experts, class_name: 'User'
end
