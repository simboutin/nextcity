Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get 'components', to: 'pages#components'
  get 'cities/results', to: 'cities#results'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cities, only: [:show] do
    resources :city_comments, only: [:new, :create]
    resources :bookmarks, only: :create
  end

  #definir le destroy
  delete 'bookmarks/:id', to: 'bookmarks#destroy', as: :delete_bookmark

  namespace :admin do
    resources :users, only: [:show]
    get 'tasks', to: 'users#tasks'

    resources :city_comments, only: [] do
      resources :answers, only: [:new, :create]

    end

  end

end
