Rails.application.routes.draw do
  resource :profile
  resource :device

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource  :profile,     only: %i(create show)
      resources :devices,     only: %i(create delete)
      resources :materials,   only: %i(index)
      resources :topics,      only: %i(create destroy)
      resources :questions,   only: %i(create)
      resources :templates,   only: %i(create)
      resources :diagnostics, only: %i(create)
    end
  end

  get :login,  to: 'devices#new'
  get :logout, to: 'devices#destroy'

  root 'root#index'
end
