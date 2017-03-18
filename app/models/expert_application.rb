class ExpertApplication < ApplicationRecord
  belongs_to :user
  scope :latest, ->{ order('id desc') }
  scope :pending, ->{ where(status: :pending) }
  scope :approved, ->{ where(status: :approved) }
  scope :rejected, ->{ where(status: :rejected) }

  # validates :license_no, presence: true

  # 通过专家申请
  def approve!
    # 创建expert_profile
    expert_profile = user.expert_profile || user.build_expert_profile
    expert_profile.license_no = self.license_no
    expert_profile.professional_title = self.professional_title
    expert_profile.save
    self.update(status: :approved)
    # 改变用户状态
    user.expert!
  end

  # 拒绝专家申请
  def reject!
    self.update(status: :rejected)
  end
end
