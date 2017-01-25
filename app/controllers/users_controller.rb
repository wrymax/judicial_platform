class UsersController < ApplicationController
  def experts
    @users = User.experts.includes(:expert_profile).paginate(page: params[:page])
  end
end
