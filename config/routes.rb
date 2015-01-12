Rails.application.routes.draw do
  root 'vents#index'
  resources :vents do
    resources :comments
  end

  namespace :admin do
    resources :vents
  end
  
  devise_for :users
end
