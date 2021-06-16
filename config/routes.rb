Rails.application.routes.draw do
  require "sidekiq/web"
  devise_for :users

  authenticate :user, ->(user) { user.email == "john@gmail.com" } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get '/validation/:serial_number', to: 'appliances#validation'

  devise_scope :user do
    authenticated do
      root to: 'appliances#index'
    end
    unauthenticated do
      root to: 'pages#home', as: :visitors_url
    end
  end  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :appliances, only: [:show, :update] do
    collection do 
      get :add
      post :link_user
    end
  end
  
  resources :events, only: [:create]
end
