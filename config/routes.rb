Mycontacts::Application.routes.draw do
  devise_for :users
  scope 'api' do
    resources :contacts
    resources :groups
  end
  root to: 'main#index'
end
