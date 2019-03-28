Rails.application.routes.draw do
  root 'sessions#new'
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/failure'

  resources :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/failure'
  #
  get   '/login', :to => 'sessions#new', :as => :login
  get '/logout', :to => 'sessions#destroy', :as => :logout
  get '/cats', :to => 'cats#index'


  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
