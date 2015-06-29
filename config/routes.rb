Rails.application.routes.draw do
  root 'projects#index'

  resources :users
  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    root 'dashboard#index'
    get '/settings', to: 'settings#index'

    resources :projects
    resources :users
    resources :issue_types
  end

  resources :projects, only: [:show], path: '' do
    resources :issues
    resources :versions,
              path: 'roadmap',
              id: /[a-zA-Z0-9\-\._]+?/,
              format: /json/,
              only: [:index, :show]

    namespace :project_settings, path: 'settings', as: :settings do
      root 'settings#index'

      resources :versions
    end
  end
end
