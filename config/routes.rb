Rails.application.routes.draw do
  root to: 'application#index'

  resources :tokens, only: [] do
    collection do
      get :show
    end
  end

  mount Sidekiq::Web, at: 'sidekiq'
end
