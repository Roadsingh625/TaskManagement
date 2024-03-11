Rails.application.routes.draw do
  resources :tasks do
    member do 
      put :assign_task
    end
  end
  devise_for :users
  root to: "tasks#index" 
  resources :roles, only: [:index, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
