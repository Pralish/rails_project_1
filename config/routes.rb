Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/index', to: 'posts#index'

    
  resources :posts do 
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
end
