class NewsController < ApplicationController
  def index
    @news = News.latest.paginate(page: params[:page], per_page: 10)
    @title = "新闻资讯"
  end

  def show
    @news = News.find(params[:id])
    @latest_news = News.latest.paginate(page: 1, per_page: 4)
    @title = "新闻资讯 | #{@news.title}"
  end
end
