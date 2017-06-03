class News < ApplicationRecord
  scope :latest, ->{ order('id desc') }

  has_attached_file :picture, {
    default_url: "/images/default/user.png"
  }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

end
