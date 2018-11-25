Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  root to: 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
  get "/logout", to: "sessions#destroy", as: :logout
  resources :registrations, only: [:new, :create]

  namespace :admin do
    root to: 'fisheries#index'
    resources :fisheries
    resources :fishes
    resources :reports, only: [:index]
    resources :catches do
      resources :scans
    end
  end
end
