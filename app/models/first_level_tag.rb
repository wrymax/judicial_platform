class FirstLevelTag < ApplicationRecord
  has_many :tags, dependent: :destroy
end
