Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'
  # ↓ナビゲーションページ
  get 'users/index' => "users#index"
  # ↓カット・カラー・パーマ
  resources :cuts, only: [:index, :show, :edit, :create, :update, :destroy]
  resources :colors, only: [:index, :show, :edit, :create, :update, :destroy]
  resources :perms, only: [:index, :show, :edit, :create, :update, :destroy]
  # カレンダー
  resources :blogs, only: [:index, :show, :edit, :create, :update, :destroy]
  # ↓お問い合わせ
  resources :contacts, only: [:create]
  get 'about' => "contacts#about",as: "contact_about"
  post 'back' => "contacts#back" ,as: 'contact_back'
end