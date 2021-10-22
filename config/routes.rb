Rails.application.routes.draw do
  resources :expenses
  resources :incomes
  resources :expense_categories
  resources :income_categories
  root 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
