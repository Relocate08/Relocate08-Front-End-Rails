Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/auth/google', as: :google_login
  get '/auth/:provider/callback', to: 'sessions#create'
end
