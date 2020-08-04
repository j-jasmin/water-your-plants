Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users
  root to: 'plants#index'

  resources :plants do
    resources :watering_events, only: [ :index, :new, :create ]
  end
end
