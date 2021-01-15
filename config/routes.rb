Rails.application.routes.draw do
  # ユーザーページ
  namespace :public, path: '' do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
  end
  
  # 管理者ページ
  namespace :admin do
    root to: 'homes#top'
  end


  #devise設定
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations',
  }

  devise_for :admins, path: 'admin', controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations',
  }
end
