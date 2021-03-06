Rails.application.routes.draw do
  namespace :encyclopedia do
    get 'main', controller: 'pages'
    resources :characteristics, only: [:index, :show]    
    resources :species
    resources :sources
  end

  get '/encyclopedia', to: redirect('/encyclopedia/main')
  root to: '/encyclopedia/main', controller: 'encyclopedia/pages', action: 'main'
end
