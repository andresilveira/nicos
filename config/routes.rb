Rails.application.routes.draw do
  resources :websites, except: [ :edit, :update, :new ]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :websites, only: [ :index, :create ]
    end
  end

  root to: 'websites#index'
end
