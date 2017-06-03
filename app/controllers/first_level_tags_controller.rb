class FirstLevelTagsController < ApplicationController
  def index
    @first_level_tags = FirstLevelTag.includes(:tags)
  end

  def show
    @first_level_tag = FirstLevelTag.find(params[:id])
  end
end
