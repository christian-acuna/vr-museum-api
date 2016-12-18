Rails.application.routes.draw do
  # devise_for :users

  namespace :v1, defaults: {format: :json} do
  	resources :collections, only: [:index]
    get '/search', to: 'collections#search'
    resources :users do
      get 'collections/:collection_id', to: 'user_collections#show'
      get 'collections', to: 'user_collections#index'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
