Rails.application.routes.draw do
  get 'category/index'
  get 'category/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items#, only: [:index, :new]
end
