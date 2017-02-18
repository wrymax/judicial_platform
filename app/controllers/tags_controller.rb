class TagsController < ApplicationController
  def keywords
    if params[:q].present?
      collection = Tag.where("name like ?", "%#{params[:q]}%").limit(8)
    else
      Tag.keyword_list.limit(8)
    end
    keywords_list = collection.map do |tag|
      {
        id: tag.name, 
        text: tag.name
      }
    end

    render json: keywords_list
  end
end
