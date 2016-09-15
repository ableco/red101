Rails.application.routes.draw do
  root 'root#index'

  get :search,    to: 'root#search'
  get :admin,     to: 'root#admin'
  get :register,  to: 'root#register'
  get :login,     to: 'devices#new'
  get :logout,    to: 'devices#destroy'
  get 'go/:slug', to: 'root#go', as: :go

  resource  :profile
  resource  :device
  resources :diagnostics
  resources :topics
  resources :templates
  resources :questions
  resources :materials
  resources :users, only: %i(index show)

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
end
