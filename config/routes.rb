Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :devices, only: :create
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "perfil", to: "user#index"

  get 'landing', to: 'landing#index'

end
