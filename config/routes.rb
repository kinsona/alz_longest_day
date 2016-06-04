Rails.application.routes.draw do
  devise_for :users

  root 'stories#index'

  resources :users, only: [:show, :edit, :update]
  resources :stories, only: [:index, :new, :create, :show]
  resources :resources, only: [:index]
  resources :conversations, only: [:index, :show, :new, :create]
  resources :messages, only: [:create]

end
