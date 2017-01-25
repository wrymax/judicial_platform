class JudicialCasesController < ApplicationController
  def index
    @judicial_cases = JudicialCase.latest.paginate(page: params[:page])
  end

  def show
    @judicial_case = JudicialCase.find(params[:id])
  end
end
