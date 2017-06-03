class WorkDynamicsController < ApplicationController
  def show
    @work_dynamic = WorkDynamic.find(params[:id])
    @latest_work_dynamics = WorkDynamic.latest.paginate(page: 1, per_page: 4)
    @title = "工作动态 | #{@work_dynamic.title}"
  end
end
