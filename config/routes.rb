Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  get 'auth/facebook/callback'  => 'sessions#create_facebook'
  
  resources :users do
    resources :vendors do
    end
  end
  
  resources :vendors  do
    resources :products do
      collection do
        patch :sort
        get :sort
       post :sort
      end
    end
  end
  resources :likes

  get '/vendors/:vendor_id/products/:id/' ,to: 'products#show', format: :js,as: 'vendor_product_path'
  get '/vendors/item/:vendor_id', to: 'vendors#item', as: 'vendors_item' 
  get '/users/:id/:favorite_item', to: 'users#favorite_item', as: 'favorite_item' 
  get '/vendors/:vendor_id/item/:id' , to: 'products#addbag' , format: :js,as: 'vendor_item_addbag'
  #get '/vendors/:vendor_id/item/:product_id' , to: 'vendors#addbag' , format: :js,as: 'vendor_item_addbag'

  authenticate :user do
    root 'home#index', as: 'authenticated_root'
  end
  resources :vendors do
    get :autocomplete_city_name, :on => :collection
  end
      
  devise_scope :user do
    root 'devise/sessions#new'
  end
  
end
