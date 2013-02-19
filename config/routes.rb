Gistapp::Application.routes.draw do
  resources :tags, only: :index

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do
    resources :gists, only: [:index, :new]
  end

  resources :gists do
    resource :favorite, only: [:create, :destroy]
  end

  root to: "gists#index"

  get "/login" => "sessions#new"
  get "/logout" => "sessions#destroy"
  get "/signup" => "users#new"

end
