Rails.application.routes.draw do

  # ユーザーページ
  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
    devise_for :customers
    resources :customers, only: [:show, :edit, :update] do
      member do
        post  'confirm', to: 'customers#confirm'
        patch '', to: 'customers#withdrawal'
      end
    end
    resources :items, only: [:index, :show]
  end
  
  # 管理者ページ
  namespace :admin do
    root to: 'homes#top'
    resources :items,  only: [:index,:new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  
  #devise設定
    # devise_for :customers, controllers: {
    #   sessions:      'customers/sessions',
    #   passwords:     'customers/passwords',
    #   registrations: 'customers/registrations',
    # }
    
  devise_for :admins, path: 'admin', controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations',
  }
end
