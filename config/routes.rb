Rails.application.routes.draw do

  # ユーザーページ
  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:index, :show]
  end
  
  # 管理者ページ
  namespace :admin do
    root to: 'homes#top'
    resources :items,  only: [:index,:new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end


  #devise設定
  devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations',
  }

  devise_for :admins, path: 'admin', controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations',
  }
end
