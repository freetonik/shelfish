Rails.application.routes.draw do

  get 'welcome/index'
  resources :users, only: [:show], path: 'u'
  resources :books

  devise_for :users

  root 'welcome#index'
end
