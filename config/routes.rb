Rails.application.routes.draw do
  root "pastries#index"
  resources :pastries
end
