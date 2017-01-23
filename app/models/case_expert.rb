class CaseExpert < ApplicationRecord
  belongs_to :judicial_case
  belongs_to :expert, class_name: 'User', foreign_key: :user_id
end
