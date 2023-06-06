Rails.application.routes.draw do
  root to: 'homes#top'
  get "about" => "homes#about", as: "about"
  resources :comments, only: [:index, :show]
  resource :members, only: [:edit, :update]
  get 'members/mypage' => 'members#show', as: 'members'
  
  namespace :public do
    get 'comments/new'
    get 'comments/index'
    get 'comments/edit'
    get 'comments/show'
  end
  namespace :public do
    get 'reviews/index'
    get 'reviews/new'
    get 'reviews/index'
    get 'reviews/edit'
    get 'reviews/show'
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
