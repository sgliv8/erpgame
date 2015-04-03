Rails.application.routes.draw do

  devise_for :users

  scope "/admin" do
    resources :users
    resources :products
  end

  resources :records do
     get 'begincash', on: :collection
  end

  resources :roles

  get 'welcome/roles'
  get 'welcome/play'
  get 'welcome/bom'
  get 'welcome/objective'
  get 'welcome/products'

  authenticated :user do
    root 'records#index', as: "authenticated_root"
  end

  root 'welcome#index'
end
