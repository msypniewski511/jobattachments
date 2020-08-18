Rails.application.routes.draw do
  

  # get 'companies/index'
  resources :addresses do
    member do
      get 'search'
    end
  end
  get '/search' => 'addresses#search'
  resources :people
  resources :companies
  
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
  end
  get 'pages/jobs'
  get '/jobs/search' => 'pages#search'
  get 'pages/jobs/:categories' => 'pages#jobs'
  get '/pages/show/:id' => 'pages#show', as: :show_job
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#jobs'
end
