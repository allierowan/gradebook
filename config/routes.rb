Rails.application.routes.draw do
  resources :teachers, only: [:new, :create, :edit, :update, :show]
  resources :students, only: [:new, :create, :edit, :update, :show] do
    resources :grades, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :parents, only: [:new, :create, :edit, :update, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :show]
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
