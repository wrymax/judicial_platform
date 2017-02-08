Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }

  resources :users do
    collection do
      get :experts
      get :personal
      get :my_needs
    end
  end

  resources :judicial_cases do
  end

  resources :needs
  resources :first_level_tags

  # 管理员
  namespace :admin do
    resources :users
  end
end
