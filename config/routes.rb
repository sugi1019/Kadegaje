Rails.application.routes.draw do

  devise_for :users

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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
