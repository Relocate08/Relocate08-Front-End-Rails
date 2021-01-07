Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#index', as: :dashboard
  get '/logout', to: 'sessions#destroy'
  get '/utilities', to: 'utilities#index', as: :utilities_discover 
end
