Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#home"

  get 'pages/home', to: 'pages#home'

  get '/cards', to: 'cards#index'

end
