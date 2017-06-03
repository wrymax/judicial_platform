class NewsController < ApplicationController
  def show
    @news = News.find(params[:id])
    @latest_news = News.latest.paginate(page: 1, per_page: 4)
    @title = "新闻资讯 | #{@news.title}"
  end
end
