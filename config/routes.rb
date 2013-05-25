Milestone::Application.routes.draw do
  get  '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :projects, only: :show, path: '', param: :slug

  root to: 'projects#index'
end
