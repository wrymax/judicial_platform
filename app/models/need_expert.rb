class NeedExpert < ApplicationRecord
  belongs_to :need
  belongs_to :expert, class_name: 'User', foreign_key: :user_id
end
