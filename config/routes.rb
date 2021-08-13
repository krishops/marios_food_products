Rails.application.routes.draw do
  root to: 'landing#index'
  resources :landing
  
  resources :products do
    resources :reviews
  end
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  # post '/products' => 'products#index'
end
