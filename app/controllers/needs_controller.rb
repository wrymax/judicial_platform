class NeedsController < ApplicationController
  before_filter :authenticate_user!

  def new 
  end

  def create
    need = current_user.needs.create(needs_params)
    if need
      flash[:notice] = "鉴定需求已提交"
      redirect_to my_needs_users_path
    else
      render :new
    end
  end

  protected

  def needs_params
    params[:need].permit!
  end
end
