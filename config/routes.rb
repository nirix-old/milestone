Milestone::Application.routes.draw do
  get "issues/index"
  get "issues/view"
  get  '/register', to: 'users#new', as: :register
  post '/register', to: 'users#create'

  get  '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: :logout

  namespace :admin do
    get '/', to: 'dashboard#index'
    get '/settings', to: 'settings#index', as: :settings
    post '/settings', to: 'settings#save'

    resources :projects
  end

  resources :projects, only: :show, path: '', param: :slug do
    get '/settings', to: 'project_settings#index', as: :settings

    resources :issues
  end

  root to: 'projects#index'
end
