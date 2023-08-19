Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'

}

   #ゲストログイン
  devise_scope :customer do
    post "customers/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # ルートパス
  root to: 'public/homes#top'

  # 管理者用
  namespace :admin do

    resources :posts, only: [:index, :show, :destroy ]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :prefectures, only: [:index, :edit, :create, :update]
    resources :ski_resorts, only: [:new, :index, :show, :create, :edit, :update]

    get 'top' => 'homes#top'
  end

  # 顧客用
  scope module: :public do
    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :prefecture, only: [:show]
    resources :ski_resorts, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update] do
      member do
        get 'customers/favorites' => 'customers#favorites'
      end
    end

    get 'homes/about' => 'homes#about'
    get  'customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch  'customers/withdraw' => 'customers#withdraw'
  end


end
