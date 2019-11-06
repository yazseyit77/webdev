Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :developers, only: [:index] 
  resources :clients, only: [:index] 
  resources :projects
end
