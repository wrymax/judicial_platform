module ApplicationHelper
  # links with bootstrap icon
  def bootstrap_icon_link_to(options={})
    link_to options[:text], options[:path], class: "glyphicon glyphicon-#{options[:icon_class]} #{options[:class]}"
  end

  # pagination html for collection
  def paginations(collection)
    content_tag :div, class: 'page-wrapper' do
      if collection.next_page
        will_paginate collection, renderer: BootstrapPagination::Rails
      else
        content_tag :div, "没有更多了", class: 'no-more'
      end
    end
  end
end
