Rails.application.routes.draw do
  # get 'users/:id', to:"users#show", as: "users_show"
  # get 'users/:id/edit', to:"users#edit", as: "users_edit"


  resources :listings do
    resources :comments
  end
  root 'pages#home'
  devise_for :users
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
