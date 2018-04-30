Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'admin/console#home', as: :authenticated_root
  end

  namespace :admin do
    get 'console', to: 'console#home'
    resources :projects
    resources :pens
    resources :articles
    root 'console#home'
  end

  resources :projects, only: [:index, :show]
  resources :articles, only: [:index, :show]
  resources :workshop, only: [:index, :show]
  get 'about-me', to: 'pages#about'

  root 'pages#home'
end
