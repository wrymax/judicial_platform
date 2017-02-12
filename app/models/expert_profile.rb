class ExpertProfile < ApplicationRecord
  belongs_to :user

  validates :license_no, presence: true
end
