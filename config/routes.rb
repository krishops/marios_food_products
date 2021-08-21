Rails.application.routes.draw do
  
  root to: 'landing#index'

  resources :products do
    resources :reviews
  end

  post '/products' => 'products#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
