Rails.application.routes.draw do
  devise_for :users, :path => 'users'
  # devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end

  namespace :v1, defaults: {format: :json} do
    get 'images', to: 'images#index'
    resources :art_objects, only: [:index, :show, :search]
    get 'search', to: 'search#search'
    get 'artsearch', to: 'search#artsearch'
    resource :login, only: [:create, :destroy], controller: :sessions
  	resources :collections, only: [:index] do
      get 'likes', to: 'likes#like'
      # get 'tags', to: 'tags#index'
      post 'tags', to: 'tags#create'
      delete 'tags', to: 'tags#destroy'
      end
    resources :users do
      get 'favorites', to: 'favorites#index'
      post 'favorites', to: 'favorites#create'
      delete 'favorites', to: 'favorites#destroy'

      get 'collections/:collection_id', to: 'user_collections#show'
      get 'collections', to: 'user_collections#index'
      post 'collections', to: 'user_collections#create'
      put 'collections/:collection_id', to: 'user_collections#update'
      delete 'collections/:collection_id', to: 'user_collections#destroy'
      post 'collections/:collection_id/art_objects', to: 'user_collection_art_objects#create'
      delete 'collections/:collection_id/art_objects', to: 'user_collection_art_objects#destroy'



    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
