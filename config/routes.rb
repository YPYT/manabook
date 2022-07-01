Rails.application.routes.draw do
  # get 'users/:id', to:"users#show", as: "users_show"
  # get 'users/:id/edit', to:"users#edit", as: "users_edit"



  root 'pages#home'
  devise_for :users
  resources :users
  get 'orders/bought', to: "orders#bought"
  post 'orders/bought', to: "orders#bought"
  get 'orders/sold', to: "orders#sold"
  post 'orders/sold', to: "orders#sold"
  resources :listings do
    resources :comments, only: [:create, :destroy]
  end
  resources :listings do
    post 'order/success', to: "orders#listing_order"
    get 'order/success', to: 'orders#success'
    post 'order/confirm', to: 'orders#confirm'
    get 'order/confirm', to: 'orders#confirm'
  end
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
