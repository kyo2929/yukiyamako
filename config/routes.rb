Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # ルートパス
  root to: 'public/homes#top'
  
  # 管理者用
  namespace :admin do
    
    resources :posts, only: [:index, :show, :edit, :update]
    resources :public, only: [:index, :show, :edit, :update]
    resources :prefecture, only: [:index, :edit, :create, :update]
    resources :ski_resorts, only: [:new, :index, :show, :create, :edit, :update]
    
    get 'top' => 'homes#top'
  end
  
  # 顧客用
  namespace :public do
    resources :posts, only: [:new, :index, :show, :create, :edit, :update]
    resources :prefecture, only: [:show]
    resources :ski_resorts, only: [:index, :show]
    
    get 'homes/about' => 'homes#about'
  end
  

end
