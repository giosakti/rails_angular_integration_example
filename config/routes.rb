ProjectOne::Application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :tasks
  end

end
