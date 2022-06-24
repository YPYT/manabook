Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  resources :listings
  root 'pages#home'
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
