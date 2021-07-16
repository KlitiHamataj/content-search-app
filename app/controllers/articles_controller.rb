class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).order("created_at DESC") # Search feature with ransack gem
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path, notice: 'Article was created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: 'Article is updated'
    else
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :source_link)
  end
end
