class Tag < ApplicationRecord
  belongs_to :first_level_tag
  
  def self.keyword_list
    Tag.pluck(:name)
  end
end
