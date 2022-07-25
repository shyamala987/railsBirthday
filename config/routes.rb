Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "birthdays#index"
  get "/birthdays", to: "birthdays#index"
  get "/birthdays/:id", to: "birthdays#show"
end
