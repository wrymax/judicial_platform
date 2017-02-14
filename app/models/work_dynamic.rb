class WorkDynamic < ApplicationRecord
  scope :latest, ->{ order('id desc') }
end
