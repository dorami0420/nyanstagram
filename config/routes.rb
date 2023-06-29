Rails.application.routes.draw do
  

  devise_for :admins, path: 'admin', skip: [:registrations, :passwords], controllers: {
    sessions: "admin/admins/sessions",
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }
  
  root to: "homes#top"
  get "homes/about"
    
  resources :users, only: [:index, :show, :edit, :update]
  resources :stray_cats do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :protective_cats do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  namespace :admin do
    root to: "home#top"
    resources :users, only: [:index, :destroy]
  end
end

