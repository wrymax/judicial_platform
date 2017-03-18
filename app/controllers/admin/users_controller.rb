class Admin::UsersController < Admin::ApplicationController
  def new
    @user = User.new
    validate_all_fields(@user)
  end

  def index
    @experts = User.experts.latest.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @user = User.find(params[:id])
    validate_all_fields(@user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新专家信息
      if @user.expert?
        @user.expert_profile.update!(expert_profile_params)
      end
      redirect_back fallback_location: admin_users_path, notice: "信息已更新"
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save(validate: false)
      # 更新专家信息
      @user.create_expert_profile(expert_profile_params)
      redirect_back fallback_location: admin_users_path, notice: "已添加专家账号"
    else
      render :new
    end

  end

  def cancel_expert
    @user = User.find(params[:id])
    @user.demander!

    redirect_back fallback_location: admin_users_path, notice: "已取消#{@user.name}的专家权限"
  end

  protected
  
  def user_params
    params[:expert_profile] = params[:user].delete(:expert_profile)
    handle_keywords_params
    params[:user].merge({user_type: 'expert'}).permit!
  end

  def expert_profile_params
    params[:expert_profile].permit!
  end

end
