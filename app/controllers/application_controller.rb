class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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

end
