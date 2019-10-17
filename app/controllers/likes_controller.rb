class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, article_id: params[:article_id])
    redirect_to articles_path
  end

  def destroy
    @like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
    @like.destroy
    redirect_to articles_path
  end

end
