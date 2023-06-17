Rails.application.routes.draw do

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
    get 'search' => 'reviews#search'
    devise_scope :member do
      post 'guest_sign_in' => 'sessions#guest_sign_in'
    end
  end

  namespace :admin do
    root to: 'homes#top'

  end
   namespace :admin do
    resources :comments
    resources :reviews
    resources :members do
      resources :reviews,only: []do
        collection do
          get 'list'
        end
      end
    end
    get '/reviews/list' => 'reviews#list'
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
