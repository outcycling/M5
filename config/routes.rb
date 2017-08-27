
  Rails.application.routes.draw do
      
  get 'pages/home'

  root 'pages#home'  
  resources :gratitudes
  resources :writings
  resources :readings
  resources :pictures
      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    end


  
