class Feedback < ApplicationRecord
  scope :latest, ->{ order('id desc') }
  validates :email, presence: true
end
