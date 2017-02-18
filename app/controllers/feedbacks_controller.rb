class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.create(feedback_params)
    if @feedback
      flash[:notice] = "感谢您提交反馈"
      redirect_to root_path
    else
      flash[:alert] = "提交失败，请重试"
      render :new
    end
  end

  private

  def feedback_params
    params[:feedback].permit!
  end
end
