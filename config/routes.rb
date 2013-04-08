ProjectOne::Application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :tasks
  end

  # Passthrough to frontend
  match '/' => 'home#index'
  match '/tasks' => 'home#index'
  match '/tasks/*page' => 'home#index'
end
