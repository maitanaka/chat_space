Rails.application.routes.draw do
  root to: 'chat_groups#index'
  devise_for :users
  resources :chat_groups do
    resources :messages
  end
end
