Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#home"

  get 'pages/home', to: 'pages#home'

  resources :cards do
    resources :coments, only: [:create]
    member do 
      post 'like'
      get 'like', to: 'cards#like'
    end
  end

  get '/cards/:id(.:format)', to: 'cards#destroy'

  get '/signup', to: 'users#new'
  resources :users, except: [:new]  

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :topics, except: [:destroy]
end
