require "monban/constraints/signed_in"

Rails.application.routes.draw do

  resource :followers, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resource :following_relationship, only: [:create, :destroy]
  end
  resources :text_subjects, only: [:create]
  resources :image_subjects, only: [:create]
  resources :shouts, only: [:create, :show]

  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "dashboards#show", as: :dashboard
    resource :following, only: ["show"]
    get "/:username", to: "users#show", as: :user
    post "/", to: "search#show"
    
  end

  root to: "sessions#new"
  get "/sign_up", to: "users#new"



end
