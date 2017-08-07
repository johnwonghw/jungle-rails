Rails.application.routes.draw do

  root to: 'products#index'

  resources :reviews, only: [:destroy]
  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create]
  end
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end

  resources :orders, only: [:create, :show]

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # these routes are used for user registration. The first renders a registration page with a form and the second route is where the form is received.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, except: [:edit, :update, :show]
  end
end
