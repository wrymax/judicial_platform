class ExpertApplicationsController < ApplicationController
  before_action :set_expert_application, only: [:show, :edit, :update, :destroy]
  before_action :check_expert_status, only: [:new, :edit]

  # GET /expert_applications/new
  def new
    if current_user.expert_application
      redirect_to edit_expert_application_path(current_user.expert_application)
    else
      @expert_application = current_user.build_expert_application
    end
    validate_all_fields(current_user)
  end

  # GET /expert_applications/1/edit
  def edit
  end

  # POST /expert_applications
  def create
    @expert_application = current_user.build_expert_application(expert_application_params)

    if @expert_application.save!
      current_user.update(user_params)
      redirect_to personal_users_path, notice: "已提交加入专家申请"
    else
      render :new
    end
  end

  # PATCH /PUT /expert_applications/1
  # def update
  #   if @expert_application.update(expert_application_params)
  #     redirect_to @expert_application, notice: 'Expert application was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /expert_applications/1
  # def destroy
  #   @expert_application.destroy
  #   redirect_to expert_applications_url, notice: 'Expert application was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expert_application
      @expert_application = ExpertApplication.find(params[:id])
    end

    def user_params
      handle_keywords_params 
      params[:user].permit!
    end

    # Only allow a trusted parameter "white list" through.
    def expert_application_params
      params[:user].delete(:expert_application).permit!
    end

    def check_expert_status
      if current_user.expert?
        redirect_to personal_users_path and return
      end
    end
end
