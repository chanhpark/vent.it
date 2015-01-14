Rails.application.routes.draw do
  root 'vents#index'
  resources :vents do
    resources :comments
  end

  resources :vents do
    member do
      get "like", to: "vents#upvote"
      get "dislike", to: "vents#downvote"
    end
  end

  resources :categories, only: [:show]

  namespace :admin do
    resources :vents
  end

  devise_for :users
end
