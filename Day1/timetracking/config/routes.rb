Rails.application.routes.draw do
  get '/' => 'site#home'
  get '/contact' => 'site#contact'
  
  #get '/projects' => 'projects#index' 
  #Convención => index para mostar listados
  #
  #get 'projects/:id' => 'projects#show' 
  #Convención => show para mostrar detalle
  #get 'projects/:project_id/entries' => 'entries#index'
  #
  #get 'projects/:project_id/entries/new' => 'entries#new' 
  #Convención => new para crear objetos

  #helper resources y sustituye a todo lo de arriba
  resources :projects, only: [:index, :show] do
  	resources :entries, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :people, only: [:new, :create, :index, :show, :update, :destroy] 
end
