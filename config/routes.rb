Rails.application.routes.draw do
  resources :user_subject_teachers
  devise_for :users
  resources :price_lists
  resources :graduates
  resources :subject_teachers
  resources :subjects
  resources :personal_records

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "school#school"
  get '/teachers', to: 'school#teachers'
  get '/school_subjects', to: 'school#school_subjects'
  get '/prices', to: 'school#prices'
  get '/personal_cabinet', to: 'personal_cabinet#personal_cabinet'
end
