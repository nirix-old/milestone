Rails.application.routes.draw do
  get 'issues/index'

  root 'projects#index'

  resources :users
  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    root 'dashboard#index'

    resources :projects
  end

  resources :projects, only: [:show], path: '', param: :slug do
    resources :issues
    resources :versions,
              path: 'roadmap',
              param: :slug,
              slug: /[a-zA-Z0-9\-\._]+?/,
              format: /json/,
              only: [:index, :show]
  end
end
