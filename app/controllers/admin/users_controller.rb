class Admin::UsersController < Admin::ApplicationController
  def index
    @experts = User.experts.latest.paginate(page: params[:page], per_page: 10)
  end
end
