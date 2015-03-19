Ecoturismo::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

  root 'home#index'

  #devise_scope :user do
  #  get '/users', to: 'users#index'
  #  get '/users/:id', to: 'users#show'
  #  get '/users/:id/edit', to: 'users#edit'
  #  patch '/users/:id', to: 'users#update'
  #end

  namespace :admin do
    resources :users
  end
end
