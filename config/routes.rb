Rails.application.routes.draw do
  root to: 'application#index'

  resources :study_sessions, only: [] do
    collection do
      post :connect
    end
    member do
      post :begin
      post :finish
      post :guess
    end
  end

  resources :opentok_credentials, only: [:index]

  mount Sidekiq::Web, at: 'sidekiq'
end
