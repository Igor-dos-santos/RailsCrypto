Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get 'home/about' 
  get 'home/lookup'
  post "/home/lookup" => '/home/lookup' 
  root 'home#index' #this will make home/index the main result of the page.
end