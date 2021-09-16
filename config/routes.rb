Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'
  
  resources :articles

  get 'registrarse', to: 'users#new'
  resources :users, except: [:new]

  get 'sesion', to: 'sessions#new'
  post 'sesion', to: 'sessions#create'
  delete 'salir', to: 'sessions#destroy'
end
