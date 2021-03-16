Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get 'components', to: 'pages#components'
  get 'cities/results', to: 'cities#results'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cities, only: [:show] do
    resources :city_comments, only: [:new, :create]
  end

  resources :searches, only: [:new, :create]
end
