Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, 
    controller: {
      sessions: 'sessions'
    }
  resources :posts do 
    resources :comments
  end

  namespace :api do
    resources :posts

    devise_for :users, 
    controller: {
      sessions: 'api/sessions'
    }
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
end
