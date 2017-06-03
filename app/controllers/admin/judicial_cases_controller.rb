class Admin::JudicialCasesController < Admin::ApplicationController
  def index
    @judicial_cases = JudicialCase.latest.paginate(page: params[:page], per_page: 20)
  end

  def edit
    @judicial_case = JudicialCase.find(params[:id])
  end

  def create
    @judicial_case = JudicialCase.create(judicial_case_params)
    if @judicial_case
      flash[:notice] = "案例已创建"
      redirect_to admin_judicial_cases_path
    else
      flash[:alert] = "案例创建失败"
      redirect_to :back
    end
  end

  def update
    @judicial_case = JudicialCase.find(params[:id])
    if @judicial_case.update!(judicial_case_params)
      flash[:notice] = "案例已更新"
      redirect_to :back
    else
      flash[:alert] = "案例更新失败"
      redirect_to :back
    end
  end

  def new
    @judicial_case = JudicialCase.new
  end

  def destroy
    @judicial_case = JudicialCase.find(params[:id])
    if @judicial_case.destroy
      flash[:notice] = "案例已删除"
      redirect_to :back
    else
      flash[:alert] = "案例删除失败"
      redirect_to :back
    end
  end

  protected

  def judicial_case_params
    handle_keywords_params(:judicial_case)
    params[:judicial_case].permit!
  end
end
