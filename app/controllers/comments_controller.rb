class CommentsController < ApplicationController
  before_action :set_article
  
  def index
    @comment = Comment.new
    @comments = @article.comments
    @like = Like.new
  end

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to action: 'index'
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end