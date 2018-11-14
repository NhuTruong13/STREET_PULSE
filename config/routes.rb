Rails.application.routes.draw do
  devise_for :users
  root to: 'searches#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :searches
end
