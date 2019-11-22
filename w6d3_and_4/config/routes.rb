Rails.application.routes.draw do
  # resources :users


  get '/users', to: 'users#index'

  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new'
  get '/users/:id/edit', to: 'users#edit'
  get '/users/:id/', to: 'users#show'
  patch '/users/:id/', to: 'users#update'
  put '/users/:id/', to: 'users#update'
  delete '/users/:id/', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/artwork_shares/:id/', to: 'artwork_shares#show'
  post '/artwork_shares/', to: 'artwork_shares#share'
  delete '/artwork_shares/:id/', to: 'artwork_shares#unshare'

  get 'users/:id/artworks', to: 'artworks#index'


 resources :comments, only: [:index, :create, :destroy]



end
