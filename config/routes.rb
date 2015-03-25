Ecoturismo::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

  root 'home#index'

  namespace :admin do
    resources :users
    resources :transactions
    resources :trips
  end
end
