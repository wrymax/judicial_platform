class News < ApplicationRecord
  scope :latest, ->{ order('id desc') }
end
