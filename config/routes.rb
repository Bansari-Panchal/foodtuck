Rails.application.routes.draw do

  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 #

 resources :places, only: [:new, :create, :edit, :update]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  get 'auth/facebook/callback'  => 'sessions#create_facebook'
  
  resources :users do
    resources :vendors 
  end

  resources :vendors  do
    resources :products
  end
  
  authenticate :user do
    root 'users#index', as: 'authenticated_root'
  end
  resources :vendors do
    get :autocomplete_city_name, :on => :collection
  end
      
  devise_scope :user do
    root 'devise/sessions#new'
  end

end
