Rails.application.routes.draw do
  root 'vents#index'
  resources :vents do
    resources :comments
  end

  resources :categories, only: [:show]

  namespace :admin do
    resources :vents
  end

  devise_for :users
end
