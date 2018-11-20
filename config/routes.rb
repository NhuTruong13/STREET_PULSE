Rails.application.routes.draw do

  root to: 'pages#home'
  get 'main_page', to: 'pages#main_page'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :searches do
    resources :reviews do
      member do
        patch 'vote'
      end
      resources :answers
    end
  end
  resources :users, only: [:show]
end
