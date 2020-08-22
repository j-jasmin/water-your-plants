Rails.application.routes.draw do
  get 'fertilizing_events/create'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get 'plants/:id/care', to: 'plants#care', as: :care

  resources :plants do
    resources :watering_events, only: [ :new, :create ]
    resources :fertilizing_events, only: [ :new, :create ]
  end
end
