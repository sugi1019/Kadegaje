Rails.application.routes.draw do
  namespace :admin do
    get 'genres/new'
    get 'genres/edit'
  end
  namespace :admin do
    get 'reviews/index'
  end
  namespace :admin do
    get 'users/index'
  end
  # コントローラーのオーバーライド反映 path:''でurlを変更
  devise_for :users, path: "", controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  # 管理者用 skip:で余分なルーティングを削除
  devise_for :admin_users, path: "admin", skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # ユーザールーティング
  root "homes#top"
  get "about", to: "homes#about"

  get 'users/confirm_deletion', to: "users#confirm_deletion"
  resources :users, only: [
    :edit,
    :show,
    :update,
    :destroy
  ]

  resources :reviews, only: [
    :new,
    :index,
    :show,
    :create,
    :edit,
    :update,
    :destroy
  ] do
    resources :comments, only: [
      :create,
      :destroy
    ]
  end

  # 管理者ルーティング
  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index]
    resources :reviews, only: [:index]
    resources :genres, only: [
      :new,
      :edit,
      :create,
      :update,
      :destroy
    ]
  end
end
