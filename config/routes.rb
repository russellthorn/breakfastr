Rails.application.routes.draw do
  root "pastries#index"
  resources :pastries, only: [:index, :show]
  resources :users, except: [:show, :index] do
    resources :pastries, except: [:index, :show]
  end

  resource :session
end
