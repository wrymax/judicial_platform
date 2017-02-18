class Admin::FeedbacksController < Admin::ApplicationController
  def index
    @feedbacks = Feedback.latest.paginate(page: params[:page], per_page: 10)
  end
end
