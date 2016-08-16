Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource  :profile,     only: %i( create show )
      resources :devices,     only: %i( create delete )
      resources :materials,   only: %i( index )
      resources :topics,      only: %i( create destroy )
      resources :questions,   only: %i( create )
      resources :templates,   only: %i( create )
      resources :diagnostics, only: %i( create )
    end
  end

  get '*path', to: 'root#index'

  root 'root#index'
end
