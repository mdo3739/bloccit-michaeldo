Rails.application.routes.draw do
  get 'advertisement/index'

  get 'advertisement/show'

  get 'welcome/index'
  get 'about', to: "welcome#about"
  get 'welcome/contact'
  resources :posts
  root to: 'welcome#index'
end
