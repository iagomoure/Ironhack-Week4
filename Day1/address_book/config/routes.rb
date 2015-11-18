Rails.application.routes.draw do
  get '/' => 'contacts#index'
  get '/new' => 'contacts#new'

  
  post("/contacts", :to => "contacts#create")
  

  get '/contacts/show/:id' => 'contacts#show'

  post '/contacts/show/:id' => 'contacts#save_favourite'

  get '/favourites' => 'contacts#favourites'

end
