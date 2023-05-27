Rails.application.routes.draw do
  scope module: :public do
    root to: "homes#top"
    get "about", to: "homes#about"
    resources :items, only: %i[index show]
    get "/customers/information/edit", to: "customers#edit"
    get "/customers/mypage", to: "customers#show"
    patch "/customers", to: "customers#update"
    get "/customers/confirm", to: "customers#confirm"
    patch "/customers/withdraw", to: "customers#withdraw"
    resources :cart_items, only: %i[index create destroy update] do
      delete :destroy_all, on: :collection
    end
    get "/orders/complete", to: "orders#complete"
    resources :orders, only: %i[new create index show]
    post "/orders/confirm", to: "orders#confirm"  # Fix the typo here from "comfirm" to "confirm"
    resources :deliveries, only: %i[index edit create update destroy]
    get 'search' => 'searches#search_list'
  end

  devise_scope :customer do
    post '/customers/guest_login', to: 'public/sessions#guest_login'
  end

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



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
