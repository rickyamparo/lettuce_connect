Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users do
    resources :handles
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/connections', to: 'connections#index'
end
