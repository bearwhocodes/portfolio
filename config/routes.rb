Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :projects
  end
  namespace :admin do
    resources :pens
  end
  namespace :admin do
    resources :articles
  end
  resources :projects, only: [:index, :show]
  resources :articles, only: [:index, :show]
  resources :workshop, only: [:index, :show]
  get 'about-me', to: 'pages#about'
  root 'pages#home'
end
