class FirstLevelTagsController < ApplicationController
  def index
    @first_level_tags = FirstLevelTag.includes(:tags)
  end
end
