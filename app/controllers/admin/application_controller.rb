class Admin::ApplicationController < ApplicationController
  before_filter :auth_admin!
  layout 'layouts/admin'

  protected
  
  def auth_admin!
    raise CanCan::AccessDenied unless current_user.admin?
  end
end
