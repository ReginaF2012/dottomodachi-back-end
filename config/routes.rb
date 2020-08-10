Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create] 
  resources :dtomos, only: [:index, :update, :create, :destroy]
  post '/login', to: 'auth#create'
  post '/autologin', to: 'auth#auto_login'
end
