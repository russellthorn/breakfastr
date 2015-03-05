Rails.application.routes.draw do
  get 'users/new'

  get 'users/edit'

  root "pastries#index"
  resources :pastries, only: [:index, :show]
  resources :users, except: [:show, :index] do
    resources :pastries, except: [:index, :show]
  end
end
