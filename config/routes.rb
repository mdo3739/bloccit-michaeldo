Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]
  get 'welcome/index'
  get 'about', to: "welcome#about"
  get 'welcome/contact'
  resources :advertisements
  resources :topics do
  	resources :posts, except: [:index] 
  end

  resources :posts, only: [] do
      resources :comments, only: [:create, :destroy]
  end
  root to: 'welcome#index'
end
