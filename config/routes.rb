Rails.application.routes.draw do
  devise_for :users
  resource :messages
  root to: 'messages#index'
  end
