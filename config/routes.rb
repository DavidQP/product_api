Rails.application.routes.draw do
  post 'api/products/load'
  get 'api/products', to: 'products#index'
  get 'api/products/:id', to: 'products#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
