Rails.application.routes.draw do
  get 'api/products/dashboards', to: 'dashboards#index'
  get 'api/products/dashboards/new', to: 'dashboards#new'
  post 'api/products/dashboards', to: 'dashboards#create'
  #post 'api/products/load', to: 'products#load'
  get 'api/products', to: 'products#index'
  get 'api/products/:id', to: 'products#show'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
