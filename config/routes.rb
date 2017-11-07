Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users do
    resources :handles
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/github', to: 'sessions#oauth_login', as: 'github_login'
  get '/auth/github/callback', :to => 'sessions#oauth_login'

  resources :connections, only: [:index, :new, :create, :destroy, :show]

  namespace :api do
    namespace :v1 do
      resources :connections, only: [:index, :show]
    end
  end
end
