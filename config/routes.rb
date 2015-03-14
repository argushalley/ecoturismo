Ecoturismo::Application.routes.draw do
  #devise_for :users

  root 'home#index'

  resources :users, only: %i[index show new create]
end
