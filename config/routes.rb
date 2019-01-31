Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post :signup, to: 'users#signup'
  post :login, to: 'users#login'
  delete :logout, to: 'users#logout'
  resources :verticals, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :courses, only: [:index, :show]
end
