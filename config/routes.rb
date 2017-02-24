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
  resources :feedbacks
  resources :tags do
    collection do
      get :keywords
    end
  end
  resources :expert_applications

  resources :helps, only: [] do
    collection do
      get :about_us
      get :laws
      get :contact_us
      get :address
      get :procedures
      get :guidelines
      get :risks
      get :explanations
      get :complain
    end
  end

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
    resources :news
    resources :work_dynamics
    resources :feedbacks
    resources :expert_applications do
      member do
        post :approve
        post :reject
      end
    end
  end
end
