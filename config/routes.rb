Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :devices,   only: %i( create delete )
      resources :materials, only: %i( index )
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "perfil", to: "user#index"
end
