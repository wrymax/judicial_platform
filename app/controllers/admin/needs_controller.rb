class Admin::NeedsController < Admin::ApplicationController
  before_filter :find_need, only: [:show, :edit, :edit_status, :update, :cancel, :assign_experts, :edit_notes]

  def index
    @needs = Need.latest.paginate(page: params[:page], per_page: 10)
  end

  def show
    @experts = @need.experts
    @demander = @need.demander
  end

  def edit
  end

  # 编辑工作进展
  def edit_status
  end

  # 编辑备忘录
  def edit_notes
  end

  # 指派负责专家
  def assign_experts
    if request.get?
      @experts = @need.experts
    end
    if request.post?
      @experts = User.where(id: params[:need][:experts])
      @need.experts.clear
      @need.experts << @experts
      flash[:notice] = "负责专家已委派"
      redirect_to admin_need_path(@need)
    end
  end

  def update
    if @need.update(need_params)
      flash[:notice] = "需求信息已更新"
      redirect_to admin_need_path(@need)
    else
      flash[:alert] = "信息更新失败"
      render :edit
    end
  end

  private

  def find_need
    @need = Need.find(params[:id])
  end

  def need_params
    params[:need].permit!
  end
end
