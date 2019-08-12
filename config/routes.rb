Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :end_users
end
