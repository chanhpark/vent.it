Rails.application.routes.draw do
  root 'vents#index'
  resources :vents do
    resources :comments
  end
  devise_for :users
end
