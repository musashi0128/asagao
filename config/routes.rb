Rails.application.routes.draw do
  get 'entries/index'

  get 'entries/show'

  get 'entries/new'

  get 'entries/edit'

  root to: "top#index"
  get "about" => "top#about", as: "about"
  get "bad_request" => "top#bad_request"
  get "internal_server_error" => "top#internal_server_error"

  resources :members do
    collection { get "search" }
    resources :entries, only: [:index]
  end
  resources :articles
  resources :entries
  resource :session, only: [:create, :destroy]
  resource :account
  match "*anything" => "top#not_found", via: [:get, :post, :patch, :delete]
end
