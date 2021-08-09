Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/admin/users_count', to: 'admin#users_count'
  get 'users', to: 'all_users#index'
  resources :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end
  root to: 'items#index'
end
