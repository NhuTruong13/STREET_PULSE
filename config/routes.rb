Rails.application.routes.draw do
  root to: 'searches#new'
  # get 'main_page', to: 'pages#main_page'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # this line added to fix the bug with user logout:
  devise_scope :user do get "/users/sign_out" => "devise/sessions#destroy" end

  resources :searches do
    resources :reviews do
      resources :answers
    end
  end
  resources :users, only: [:show]
end
