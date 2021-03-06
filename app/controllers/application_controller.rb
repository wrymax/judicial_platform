class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_mobile

  def validate_all_fields(user)
    %w(name phone pitch resume keyword_list).each do |column|
      user.send("validate_#{column}=", true)
    end
  end

  def handle_keywords_params(model=:user)
    # 处理keyword_list参数可能存在数字和中文夹杂的情况
    keyword_list = params[model][:keyword_list]
    if keyword_list
      id_list = keyword_list.select do |k|
        k.match(/[0-9]/) 
      end
      id_list_names = Tag.where(id: id_list).pluck(:name)
      params[model][:keyword_list] = keyword_list - id_list + id_list_names
    else
      params[model][:keyword_list] = []
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :phone, :name])
  end

  def check_mobile
    if !params[:controller].start_with?('mobile/')
      if is_mobile?
        redirect_to mobile_home_index_path
      end
    end
  end

  def is_mobile?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"].match(/android|Mobile|iPhone/)
  end

end
