Rails.application.routes.draw do
  root 'root#index'

  controller :root do
    get 'buscar',       action: :search,    as: :search
    get 'diagnosticar', action: :diagnose,  as: :diagnose
    get 'configurar',   action: :configure, as: :configure
    get 'v/:slug',      action: :visit,     as: :visit
  end

  resource  :device, only: %i(new create update destroy)

  resources :users
  resources :diagnostics

  resources :topics,    only: %i(new create index edit update destroy)
  resources :templates, only: %i(new create index edit update destroy)
  resources :questions, only: %i(new create index edit update destroy)
  resources :materials, only: %i(new create index edit update destroy)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource  :device,      only: %i(show create update destroy)
      resources :users,       only: %i(show create update destroy)
      resources :diagnostics, only: %i(show create update destroy)
      resources :topics,      only: %i(index)
      resources :templates,   only: %i(index)
      resources :materials,   only: %i(index)
    end
  end
end
