Rails.application.routes.draw do
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
    get 'comments/edit'
  end
  namespace :admin do
    get 'reviews/index'
    get 'reviews/show'
    get 'reviews/edit'
  end
  namespace :admin do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
  end
  # namespace :public do
  #   get 'relationships/followings'
  #   get 'relationships/followers'
  # end
  root to: 'public/homes#top'
  get "about" => "public/homes#about", as: "about"
  get "/top/index" => "public/homes#index"
  resources :comments, only: [:index, :show]
  resource :members, only: [:show, :edit, :update]

  scope module: :public do
    resources :reviews do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
    resource :relationships, only: [:create, :destroy]
    # post '/members/sign_up' => 'members#sign_up', as: 'members_sign_up'
    get '/mypage/:id' => 'members#show', as: 'mypage'
    get '/edit/mypage' => 'members#edit'
    patch '/edit/mypage' => 'members#update'
    get 'mdmbers/confirm' => 'members#confirm'
    patch 'members/withdraw' => 'members#withdraw'
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get "search" => "searches#search"
    devise_scope :member do
      post 'guest_sign_in' => 'sessions#guest_sign_in'
    end
  end
  
  





  # 顧客用
  # URL /customers/sign_in ...
  devise_for :members,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
