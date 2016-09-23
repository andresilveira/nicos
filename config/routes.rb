Rails.application.routes.draw do
  resources :websites, except: [:edit, :update, :new]
  root to: 'websites#index'
end
