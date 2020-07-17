Rails.application.routes.draw do
  devise_for :users
  root to: 'plants#index'

  resources :plants do
    resources :watering_events, only: [:index, :new, :create]
  end
end
