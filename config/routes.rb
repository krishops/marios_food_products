Rails.application.routes.draw do
  resources :products do
    resources :reviews
  end

  root to: 'landing#index'
  post '/products' => 'products#index'

  
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
