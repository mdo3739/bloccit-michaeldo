Rails.application.routes.draw do
  get 'welcome/index'
  get 'about', to: "welcome#about"
  get 'welcome/contact'
  resources :posts, :advertisements
  root to: 'welcome#index'
end
