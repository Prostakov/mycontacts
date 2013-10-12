Mycontacts::Application.routes.draw do
  devise_for :users
  resources :contacts
  resources :groups
  root to: 'main#index'
end
