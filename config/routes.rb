Rails.application.routes.draw do
  root to: 'pages#home'
  resources :messages, only: [:index, :show, :new, :create, :destroy]
  resources :photos, only: [:index, :show, :new, :create, :destroy]
end
