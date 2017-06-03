module HomeHelper
  def home_tag_link(name)
    link_to name, first_level_tag_path(FirstLevelTag.find_by_name(name))
  end
end
