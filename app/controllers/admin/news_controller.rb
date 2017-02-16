class Admin::NewsController < Admin::ApplicationController
  before_action :find_news, only: [:edit, :update, :destroy, :show]
  layout 'layouts/admin'

  def index
    @news = News.latest.paginate(page: params[:page], per_page: 10)
  end

  def new
    @news = News.new
  end

  def create
    if @news = News.create(news_params)
      flash[:notice] = "新闻已创建"
      redirect_to admin_news_index_path
    else
      flash[:alert] = "新闻创建出错"
      render :new
    end
  end

  def edit
  end

  def update
    if @news.update(news_params)
      flash[:notice] = "新闻已更新"
      redirect_to admin_news_index_path
    else
      flash[:alert] = "新闻更新出错"
      render :edit
    end
  end

  private

  def news_params
    params[:news].permit!
  end

  def find_news
    @news = News.find(params[:id])
  end
end
