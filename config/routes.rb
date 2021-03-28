Rails.application.routes.draw do
  resources :transactions_histories
   get 'home/transactions'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
