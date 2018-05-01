Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'admin/console#home', as: :authenticated_root
  end

  namespace :admin do
    post "/upload_image" => "upload#upload_image", :as => :upload_image
    post "/upload_file" => "upload#upload_file", :as => :upload_file
    get "/download_file/:name" => "upload#access_file", :as => :upload_access_file, :name => /.*/
    get 'console', to: 'console#home'
    resources :projects
    resources :pens
    resources :articles
    resources :technologies
    root 'console#home'
  end

  resources :projects, only: [:index, :show]
  resources :articles, only: [:index, :show]
  resources :workshop, only: [:index, :show]
  get 'about-me', to: 'pages#about'
  get "/download_file/:name" => "admin/upload#access_file", :as => :upload_access_file, :name => /.*/

  root 'pages#home'
end
