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
  resources :work_dynamics
  resources :news

  # 管理员
  namespace :admin do
    resources :users
    resources :judicial_cases
    resources :needs do
      member do
        get :edit_status
        get :assign_experts
        post :assign_experts
        get :edit_notes
      end
    end
  end
end
