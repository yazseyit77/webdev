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
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  
  resources :users

  resources :clients do

    resources :projects
  end
  
  resources :projects
  resources :clients

  get 'client/:id/projects', to: 'projects#index', as: 'this_client_projects'
  


end
