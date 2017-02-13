class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:personal, :my_needs]
  load_and_authorize_resource :user, only: [:update]

  def experts
    @users = User.experts.includes(:expert_profile).paginate(page: params[:page], per_page: 12)
  end

  def show
    @user = User.find(params[:id])
    if @user.expert?
      @cases = @user.judicial_cases.latest.paginate(page: 1, per_page: 4)
      @similar_experts = @user.similar_experts.paginate(page: 1, per_page: 4)
    end
  end

  # 个人中心
  def personal

  end

  # 我的鉴定需求
  def my_needs
    @needs = current_user.needs.paginate(page: params[:page])
  end

  # 更新个人信息
  def update
    if current_user.update(user_params)
      # 更新专家信息
      if current_user.expert?
        current_user.expert_profile.update!(expert_profile_params)
      end
      redirect_back fallback_location: personal_users_path, notice: "个人信息已更新"
    else
      render :personal
    end
  end

  protected
  
  def user_params
    params[:expert_profile] = params[:user].delete(:expert_profile)
    params[:user].permit!
  end

  def expert_profile_params
    params[:expert_profile].permit!
  end
end
