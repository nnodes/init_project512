Rails.application.routes.draw do

  resources :render_scaffolds
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    resources :settings, only: [:index] do
      collection do
        get :edit
        post :update
      end
    end
    resources :users
    resources :pages
    resources :slides do
      collection do
        get '/:id/image', to: 'slides#destroy_image', as: 'image'
      end
    end
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
  get '/:url', to: 'pages#show', as: 'page'
end
