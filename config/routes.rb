Rails.application.routes.draw do
  
  get '/signup', to: 'users#new'
  root 'static_pages#top'
  
  #ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  
  resources :users
  
  
end
