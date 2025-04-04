Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'reviews/new'
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/destroy'
  get 'users/edit'
  get 'users/show'
  get 'users/update'
  get 'users/destroy'
  get 'users/confirm_deletion'
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
