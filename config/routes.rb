Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :appliances, only: [:show, :update] do
    collection do 
      get :add
      post :link_user
    end
  end
end
