class UsersController < ApplicationController
  def experts
    @users = User.experts.includes(:expert_profile).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  # 个人中心
  def dashboard
  end
end
