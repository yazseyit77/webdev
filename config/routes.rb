Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: "callbacks"  }
  
    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
    end
    devise_scope :user do
      get 'signup', to: 'devise/registrations#new'
    end
    devise_scope :user do
      get '/users/sign_out', to: 'devise/sessions#destroy'
    end
    
    root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :clients do
    resources :projects
  end
  
  resources :users, only: [:index, :show]
  resources :projects
  resources :clients
  


end #the whole Rails.application.routes.draw do
