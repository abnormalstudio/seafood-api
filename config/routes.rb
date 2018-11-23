Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  namespace :admin do
    root to: 'fisheries#index'
    resources :fisheries
    resources :fishes
    resources :catches do
      resources :scans
    end
  end
end
