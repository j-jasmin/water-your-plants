Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  root to: 'plants#index'

  resources :plants do
    resources :watering_events, only: [ :index, :new, :create ]
  end
end
