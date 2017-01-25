class JudicialCase < ApplicationRecord
  acts_as_taggable_on :keywords

  has_many :case_experts, dependent: :destroy
  has_many :experts, through: :case_experts, class_name: 'User'

  scope :latest, ->{ order('id desc') }
end
