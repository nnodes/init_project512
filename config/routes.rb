Rails.application.routes.draw do

  namespace :admin do
    resources :settings, only: [:index] do
      collection do
        get :edit
        post :update
      end
    end
    resources :users
  end

  devise_for :users, :path_prefix => 'my', :controllers => {:registrations => "registrations"}
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home#landing', as: :unauthenticated_root
    end  
  end
end