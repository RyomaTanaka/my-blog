Rails.application.routes.draw do
  
  devise_for :users
  root 'articles#index'
  resources :users
  resources :articles do
    resources :comments, only: [:index, :create]
    resources :likes, only: :create
  end
  post "likes/:article_id/destroy" => "likes#destroy"

end