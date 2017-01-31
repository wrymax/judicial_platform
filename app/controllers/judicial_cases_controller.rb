class JudicialCasesController < ApplicationController
  def index
    @judicial_cases = JudicialCase.latest.paginate(page: params[:page])
  end

  def show
    @judicial_case = JudicialCase.find(params[:id])
    @similar_cases = @judicial_case.similar_cases.paginate(page: 1, per_page: 4)
  end
end
