Rails.application.routes.draw do
  post "follow/:user_id" => "follows#follow"
  post "follow/destroy/:user_id" => "follows#destroy"
  
  post "like/:tweet_id" => "likes#like"
  post "like/destroy/:tweet_id" => "likes#destroy"
  
  get 'show/:id', to: 'tweets#show'
  get 'tweets/new', to: 'tweets#new_tweet'
  post 'tweet', to: 'tweets#tweet'
  get 'timeline', to: 'tweets#timeline'
  
  get 'tweets/timeline'
  get 'mypage/:id/:login_id', to:'users#mypage'
  get 'following/:id', to:'users#following'
  get 'followed/:id', to:'users#followed'
  get 'likes/:id', to:'users#mylike'
  get 'signup', to:'users#new'
  post 'create', to: 'users#create'
  get 'edit/:id', to:'users#edit'
  post 'update/:id', to:'users#update'
  get 'login', to: 'users#login_form'
  post 'login', to: 'users#login'
  post 'logout', to: 'users#logout'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
