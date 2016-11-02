Rails.application.routes.draw do
  root to: 'messages#index'
  devise_for :users
  resource :messages
end
