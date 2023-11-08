Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'users#index'
  get "up" => "rails/health#show", as: :rails_health_check
  # resources :users, only: [:new, :create]
  # Defines the root path route ("/")
  # root "users#index"
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/posts', to: 'users#posts', as: 'user_posts'
  get '/users/:id/posts/:post_id', to: 'posts#show', as: 'user_post'
end
