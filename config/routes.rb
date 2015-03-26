Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'
  get 'about', to: "welcome#about"
  get 'welcome/contact'
  resources :advertisements
  resources :topics do
  	resources :posts, except: [:index] do
      resources :summaries, except: [:index]
    end
  end
  root to: 'welcome#index'
end
