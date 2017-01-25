Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }

  resources :users do
    collection do
      get :experts
      get :dashboard
    end
  end

  resources :judicial_cases do
  end
end
