class WorkDynamicsController < ApplicationController
  def show
    @work_dynamic = WorkDynamic.find(params[:id])
    @latest_work_dynamics = WorkDynamic.latest.paginate(page: 1, per_page: 4)
  end
end
