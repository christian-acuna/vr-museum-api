Rails.application.routes.draw do
  # devise_for :users

  namespace :v1, defaults: {format: :json} do
    resources :art_objects, only: [:index, :show]
    resources :searches, only: [:search]
    resource :login, only: [:create, :destroy], controller: :sessions
  	resources :collections, only: [:index]
    resources :users do
      get 'collections/:collection_id', to: 'user_collections#show'
      get 'collections', to: 'user_collections#index'
      post 'collections', to: 'user_collections#create'
      put 'collections', to: 'user_collections#update'
      delete 'collections', to: 'user_collections#destroy'


    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
