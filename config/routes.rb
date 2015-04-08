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

      post '/up-vote' => 'votes#up_vote', as: :up_vote
      post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  root to: 'welcome#index'
end
