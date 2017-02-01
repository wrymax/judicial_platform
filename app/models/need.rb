class Need < ApplicationRecord
  acts_as_taggable_on :keywords

  belongs_to :demander, foreign_key: :user_id, class_name: 'User'
  has_many :need_experts, dependent: :destroy
  has_many :experts, through: :case_experts, class_name: 'User'

  validates :content, presence: true, length: { within: 1..5000 }

  def i18n_status
    I18n.t("custom.need.status.#{self.status}")
  end
end
