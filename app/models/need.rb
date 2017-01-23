class Need < ApplicationRecord
  belongs_to :demander, foreign_key: :user_id, class_name: 'User'
  has_many :need_experts, dependent: :destroy
  has_many :experts, through: :case_experts, class_name: 'User'
end
