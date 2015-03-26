Rails.application.routes.draw do
  devise_for :users

  scope "/admin" do
    resources :users
  end

  resources :records

  resources :roles

  get 'welcome/index'

  authenticated :user do
    root 'records#index', as: "authenticated_root"
  end

  root 'welcome#index'
end
