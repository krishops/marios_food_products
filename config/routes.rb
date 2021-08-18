Rails.application.routes.draw do
  

  root to: 'landing#index'
  post '/products' => 'products#index'

  resources :products do
    resources :reviews
  end
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
