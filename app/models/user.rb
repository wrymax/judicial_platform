class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :expert_profile, dependent: :destroy
  has_many :case_experts, dependent: :destroy
  has_many :judicial_cases, through: :case_experts
  has_many :need_experts, dependent: :destroy

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
end
