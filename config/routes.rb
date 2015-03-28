Ecoturismo::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

  root 'home#index'

  namespace :admin do
    resources :users
    resources :transactions
    resources :trips
    namespace :reports do
      get 'trips_report', to: 'trips_report#index'
      get 'trips_report/:id', to: 'trips_report#show'
    end
  end
end
