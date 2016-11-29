Rails.application.routes.draw do

  resources :parents, only: [:new, :create, :edit, :update, :show]
  resources :teachers, only: [:new, :create, :edit, :update, :show]
  resources :students, only: [:new, :create, :edit, :update, :show]
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
