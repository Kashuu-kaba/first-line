Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :lines, except: [:new] do
    resource :favorites, only: [:create, :destroy]

    resources :comments, only: [:create, :destroy]

    resources :stories, only: [:show, :create, :edit, :update]
      #resources :comments, only: [:create, :destroy]
    
  end
  resources :users, only: [:show, :edit, :update]
end
