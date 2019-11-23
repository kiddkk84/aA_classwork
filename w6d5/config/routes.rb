Rails.application.routes.draw do
  resources :cats, only: [:index, :show, :new, :create]



      #  GET  /cats/new(.:format)        cats#new
      # GET  /cats/:id(.:format)         cats#show


  #  cats GET    /cats(.:format)              cats#index

  #   cat GET    /cats/:id(.:format)          cats#show


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
