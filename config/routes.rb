Rails.application.routes.draw do
  root to: 'end_items#index'
  resources :end_users, only: [:show, :edit, :update]do
    get 'unsubscribe', :on => :collection
  end
  resources :end_addresses, only: [:new, :create, :destroy]

  resources :end_purchase_histories, only: [:index]
  resources :end_cart_items, only: [:update, :index, :destroy]do
    post 'add', :on => :collection
  end
  resources :end_items, only: [:index, :show]do
    resources :end_reviews, only: [:create]
    resource :end_favorites, only: [:create, :destroy]
    get 'search_result', :on => :collection
    post 'search', :on => :collection
    get 'search', :on => :collection
  end
  resources :end_purchases, only: [:index, :create]
  resources :admin_users, only: [:index, :update, :destroy, :edit]do
    get 'search', :on => :collection
  end
  resources :admin_items, except: [:show]do
    get 'search', :on => :collection
  end
  resources :admin_reviews, only: [:edit, :update, :destroy, :index]do
    get 'search', :on => :collection
  end
  resources :admin_purchase_histories, only: [:update, :show, :index]do
    get 'search', :on => :collection
  end

  devise_for :admin_users, skip: :all
  devise_scope :admin_user do
    get 'admin_users/devise/sign_in' , to: 'devise/sessions#new', as: :new_admin_user_session
    post 'admin_users/devise/sign_in' , to: 'devise/sessions#create', as: :admin_user_session
    delete 'admin_users/devise/sign_out' , to: 'devise/sessions#destroy', as: :destroy_admin_user_session
  end

  devise_for :end_users, skip: :all
  devise_scope :end_user do
    get 'end_users/devise/sign_in' , to: 'devise/sessions#new', as: :new_end_user_session
    post 'end_users/devise/sign_in' , to: 'devise/sessions#create', as: :end_user_session
    delete 'end_users/devise/sign_out' , to: 'devise/sessions#destroy', as: :destroy_end_user_session
    get 'end_users/devise/sign_up' , to: 'end_users/registrations#new', as: :new_end_user_registration
    post 'end_users/devise' , to: 'end_users/registrations#create', as: :end_user_registration
    delete 'end_users/devise' , to: 'devise/registrations#destroy', as: :destroy_end_user_registration
  end

end
