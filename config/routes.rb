World::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # redirects
  match '/countries' => redirect('/')

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Resource routes
  resources :countries do
    resources :cities
    resources :languages
  end

  resources :users, :only => [:new, :create]
  match '/:id/profile' => 'users#show', :as => :user_profile

  match '/login' => 'sessions#new'
  match '/logout' => 'sessions#destroy'
  resources :sessions, :only => [:new, :create, :destroy]

  # root
  root :to => 'countries#index'
end
