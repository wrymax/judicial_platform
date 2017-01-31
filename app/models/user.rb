class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_taggable_on :keywords

  has_one :expert_profile, dependent: :destroy
  has_many :case_experts, dependent: :destroy
  has_many :judicial_cases, through: :case_experts
  has_many :need_experts, dependent: :destroy
  scope :experts, ->{ where('user_type = ?', 'expert') }

  has_attached_file :avatar, {
    styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default/user.png",
    :convert_options => {
      :thumb => "-resize 150x150 -gravity center -background white -extent 150x150",
      :medium => "-resize 300x300 -gravity center -background white -extent 300x300"
    },
    :processors => [:cropper]
  }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  # 权限控制
  def admin?
    is_admin
  end

  # 专家？
  def expert?
    user_type == 'expert'
  end

  def expert!
    self.update_attribute(:user_type, 'expert')
  end

  # 需求方？
  def demander?
    user_type == 'demander'
  end

  def demander!
    self.update_attribute(:user_type, 'demander')
  end

  # 需求关系
  def needs
    if self.expert?
      Need.joins('inner join need_experts ne on ne.need_id = needs.id').where("ne.user_id = ?", self.id)
    else
      Need.where(user_id: self.id)
    end
  end


  def similar_experts
    User.experts.tagged_with(self.keyword_list, on: :keywords, any: true).where('id != ?', self.id)
  end

  ### For paperclip cropper
  attr_accessor :crop_h, :crop_w, :crop_x, :crop_y

  def geometry(style = :medium)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(picture.path(style))
  end

  def reprocess_avatar
    picture.reprocess!
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def reprocess_crop(params)
    unless params.blank?
      unvalidate_update!(params)
      # update_attributes(params)
      reprocess_avatar
      clear_coordinates
    end
  end

  def clear_coordinates
    unvalidate_update!({:crop_x => nil, :crop_y => nil, :crop_w => nil, :crop_h => nil})
  end
end
