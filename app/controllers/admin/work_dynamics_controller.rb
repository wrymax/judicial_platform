class Admin::WorkDynamicsController < Admin::ApplicationController
  before_action :find_work_dynamic, only: [:edit, :update, :destroy, :show]
  layout 'layouts/admin'

  def index
    @work_dynamics = WorkDynamic.latest.paginate(page: params[:page], per_page: 10)
  end

  def new
    @work_dynamic = WorkDynamic.new
  end

  def create
    if @work_dynamic = WorkDynamic.create(work_dynamics_params)
      flash[:notice] = "工作动态已创建"
      redirect_to admin_work_dynamics_path
    else
      flash[:alert] = "工作动态创建出错"
      render :new
    end
  end

  def edit
  end

  def update
    if @work_dynamic.update(work_dynamics_params)
      flash[:notice] = "工作动态已更新"
      redirect_to admin_work_dynamics_path
    else
      flash[:alert] = "工作动态更新出错"
      render :edit
    end
  end

  private

  def work_dynamics_params
    params[:work_dynamic].permit!
  end

  def find_work_dynamic
    @work_dynamic = WorkDynamic.find(params[:id])
  end

end
