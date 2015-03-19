Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'about', to: "welcome#about"
  get 'welcome/contact'
  resources :posts, :advertisements
  root to: 'welcome#index'
end
