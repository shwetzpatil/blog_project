Rails.application.routes.draw do
  
  devise_for :users
  resources :users
  get 'welcome/index'
  get 'welcome/contact'
  post 'welcome/thank_you'

  resources :articles do
    resources :comments 
  end  
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
