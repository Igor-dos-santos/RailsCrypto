Rails.application.routes.draw do
  resources :crypto_dbs
  devise_for :users 
  resources :posts
  get 'home/about' 
  get 'home/lookup'
  post "/home/lookup" => '/home/lookup' 
  root 'home#index' 
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
end
