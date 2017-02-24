class Admin::ExpertApplicationsController < Admin::ApplicationController
  def index
    @expert_applications = ExpertApplication.latest.pending.paginate(page: params[:page], per_page: 10)
  end

  def approve
    @expert_application = ExpertApplication.find(params[:id])
    if @expert_application.approve!
      user = @expert_application.user
      redirect_to :back, notice: "已通过#{user.name}的专家申请"
    else
      redirect_to :back, alert: "操作失败"
    end
  end


  def reject
    @expert_application = ExpertApplication.find(params[:id])
    if @expert_application.reject!
      user = @expert_application.user
      redirect_to :back, notice: "已拒绝#{user.name}的专家申请"
    else
      redirect_to :back, alert: "操作失败"
    end
  end

end
