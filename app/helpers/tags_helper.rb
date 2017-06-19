module TagsHelper
  def experts_filter(text, tag_name=nil)
    link_to text, experts_users_path(tag: tag_name), class: "filter#{" chosen" if params[:tag] == tag_name}"
  end
end
