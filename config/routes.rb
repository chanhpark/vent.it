Rails.application.routes.draw do
  root 'vents#index'
  resources :vents do
    member do
      get "like", to: "vents#upvote"
      get "dislike", to: "vents#downvote"
    end
    resources :comments, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :categories, only: [:show]

  resources :words, only: [:index]

  namespace :admin do
    resources :vents
  end

  devise_for :users
end
