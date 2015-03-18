Ecoturismo::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

  root 'home#index'

  devise_scope :user do
    get '/users', to: 'users#index'
  end
end
