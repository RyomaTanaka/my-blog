class UsersController < ApplicationController
  def show
    @articles = Article.where(user_id: current_user.id)
  end
end
