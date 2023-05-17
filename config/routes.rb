Rails.application.routes.draw do
  
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }


  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :admin do
    get "/"=>"homes#top"
    resources :items ,only: [:index,:new,:create,:show,:edit,:update]
    resources :genres ,only: [:index,:create,:edit,:update]
    resources :customers ,only: [:index,:show,:edit,:update]
    resources :orders ,only: [:show,:update]
    resources :order_details ,only: [:update]
  end

  root to: "homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
