Rails.application.routes.draw do
  # get 'public/new'
  # get 'login', to: 'sessions#new', as: 'login'
  # get 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'sign_up', to: 'users#new', as: 'sign_up'
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Defines the root path route ("/")
  # root 'public#new'

  # get 'birthdays', to: "birthdays#index", as: 'birthdays'

  resources :birthdays, :users, :sessions
end
