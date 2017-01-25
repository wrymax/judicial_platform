class UsersController < ApplicationController
  def experts
    @users = User.experts.includes(:expert_profile).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    if @user.expert?
      @cases = @user.judicial_cases.latest.paginate(page: 1, per_page: 4)
    end
  end

  # 个人中心
  def dashboard
  end
end
