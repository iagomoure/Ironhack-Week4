Rails.application.routes.draw do
  get '/index' => 'contacts#index'
  get '/new' => 'contacts#new'

  
  post("/contacts", :to => "contacts#create")
  get '/contacts' => 'contacts#index'

  get '/contacts/show/:id' => 'contacts#show'
end
