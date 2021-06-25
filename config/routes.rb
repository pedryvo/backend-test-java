Rails.application.routes.draw do
  post '/park', to: 'parking#park'
  resources :vehicles
  resources :companies
end
