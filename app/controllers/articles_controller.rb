class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
    @articles = Article.all
    @article = Article.new
    @like = Like.new
  end

  def create
    Article.create(article_params)
    redirect_to action: 'index'
  end

  def show
    @articles = Article.where('title LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_comments_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to action: 'index'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body).merge(user_id: current_user.id)
  end
end
