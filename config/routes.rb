
  Rails.application.routes.draw do
      
        root "pages#home"
       
      
  resources :manage_photos
   
  resources :gratitudes
  resources :writings
  resources :readings
  resources :pictures
      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  get 'pages/home'
  get '/users' => 'pages#users', as: :users
  get 'users/:id' => 'pages#show', as: :show_user      
    end


  
