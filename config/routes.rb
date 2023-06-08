Rails.application.routes.draw do
  root to: 'public/homes#top'
  get "about" => "public/homes#about", as: "about"
  resources :comments, only: [:index, :show]
  resource :members, only: [:edit, :update]

  scope module: :public do
    resources :reviews do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
    # post '/members/sign_up' => 'members#sign_up', as: 'members_sign_up'
    get '/mypage' => 'members#index', as: 'mypage'
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
