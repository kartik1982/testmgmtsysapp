Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  # get 'users/new', to: 'devise#new'
  get 'testmanagement', to: 'pages#testmanagement'
  get 'testresources', to: 'pages#testresources'
  get 'reportmanagement', to: 'pages#reportmanagement'
  get 'projectmanagement', to: 'pages#projectmanagement'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources 'testcases'
  resources 'testsuites'
  resources 'groups'
  resources 'devices'
  resources 'users'
  resources 'reports'
  resources 'releases'
  resources 'projects'
  namespace :api do
    namespace :v1 do
      resources :reports, except:[:new, :edit]
      resources :projects, only:[:show]
      resources :releases, only:[:show]
      resources :testcases, only:[:show]
      resources :testsuites, only:[:show]
    end
  end
end
