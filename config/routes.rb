# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/privacy', to: 'home#privacy'
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#index', as: :dashboard

  get '/address', to: 'service_category#index'
  get '/:location/:services', to: 'services#index', as: :service_index
  get '/:location/:services/:type', to: 'service_types#index'
end
