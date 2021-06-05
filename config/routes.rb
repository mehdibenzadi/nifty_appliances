Rails.application.routes.draw do
  devise_for :users

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

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
