Milestone::Application.routes.draw do
  get "settings/index"
  get  '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    get '/', to: 'dashboard#index'
    get '/settings', to: 'settings#index'
  end

  resources :projects, only: :show, path: '', param: :slug

  root to: 'projects#index'
end
