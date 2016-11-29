Rails.application.routes.draw do
  get 'sessions/new'

  resources :parents, only: [:new, :create, :edit, :update, :show]
  resources :teachers, only: [:new, :create, :edit, :update, :show]
  resources :students, only: [:new, :create, :edit, :update, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
