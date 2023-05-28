Rails.application.routes.draw do
  resources :price_lists
  resources :graduates
  resources :subject_teachers
  resources :subjects
  resources :personal_records
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
