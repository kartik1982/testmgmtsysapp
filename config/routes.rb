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
  resources 'reports' do
    collection do
      get 'testsuites'
      get 'releases'
      get 'filter'
    end
  end
  resources 'releases'
  resources 'projects'
  resources 'testcycles'
  namespace :api do
    namespace :v1 do
      resources :reports, except:[:new, :edit]
      resources :projects, only:[:show, :index]
      resources :releases, only:[:show, :index]
      resources :testcycles, only:[:show, :index]
      resources :testcases, only:[:show, :index]
      resources :testsuites, only:[:show, :index]
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
    end
  end
end
