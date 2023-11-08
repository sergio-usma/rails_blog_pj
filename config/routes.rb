Rails.application.routes.draw do
  root 'users#index'
  get "up" => "rails/health#show", as: :rails_health_check
  get '/users', to: 'users#index', as: 'users'
  get '/users/:user_id', to: 'users#show', as: 'user'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:id/posts/:post_id', to: 'posts#show', as: 'user_post'
end
