Rails.application.routes.draw do
  root 'vents#index'
  resources :vents
  devise_for :users
end
