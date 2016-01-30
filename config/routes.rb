Rails.application.routes.draw do
  get 'map/index'

  root 'products#index'
  resources :products, only: :index do 
  	collection { post :import }
  end
  
 
end
