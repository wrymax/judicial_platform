class FirstLevelTagsController < ApplicationController
  def index
    @first_level_tags = FirstLevelTag.includes(:tags)
    @title = "鉴定领域 | 六大鉴定领域"
  end

  def show
    @first_level_tag = FirstLevelTag.find(params[:id])
    @title = "鉴定领域 | #{@first_level_tag.name}"
  end
end
