Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  root to: "sessions#new"

  get "/sign_up" => "users#new"

end
