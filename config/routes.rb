Rails.application.routes.draw do
  root "pastries#index"
  resources :pastries do
    resources :orders, only: [:new, :create, :show]
  end
  resources :users, except: [:show, :index] do
    resources :pastries, only: [:index]
  end

  resources :orders, only: :show
  resource :session
end
