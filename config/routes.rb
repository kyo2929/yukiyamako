Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'

  }

  # ゲストログイン
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: %i[registrations passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # ルートパス
  root to: 'public/homes#top'

  # 管理者用
  namespace :admin do
    resources :posts, only: %i[index show destroy]
    resources :customers, only: %i[index show edit update]
    resources :prefectures, only: %i[index edit create update]
    resources :ski_resorts, only: %i[new index show create edit update]

    get 'top' => 'homes#top'
  end

  # 顧客用
  scope module: :public do
    resources :posts, only: %i[new index show create edit update destroy] do
      resources :post_comments, only: %i[create destroy]
      resource :favorites, only: %i[create destroy]
    end
    resources :prefecture, only: [:show]
    resources :ski_resorts, only: %i[index show]
    resources :customers, only: %i[show edit update] do
      member do
        get 'customers/favorites' => 'customers#favorites'
      end
    end

    get 'homes/about' => 'homes#about'
    get 'customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch 'customers/withdraw' => 'customers#withdraw'
  end
end
