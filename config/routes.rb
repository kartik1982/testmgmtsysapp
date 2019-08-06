Rails.application.routes.draw do
require 'sidekiq/web'
require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'testexecutionmanagement', to: 'pages#testexecutionmanagement'
  get 'testmanagement', to: 'pages#testmanagement'
  get 'testresources', to: 'pages#testresources'
  get 'reportmanagement', to: 'pages#reportmanagement'
  get 'projectmanagement', to: 'pages#projectmanagement'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources 'testcases'
  resources 'testsuites' do
    member do
      post 'order'
    end
  end
  resources 'groups'
  resources 'devices'
  resources 'users'
  resources 'reports' do
    collection do
      get 'testsuites'
      get 'releases'
      get 'filter'
    end
    member do
      get 'testsuite'
    end
  end
  resources :testexecutions do
    collection do
      get :testcases
      post :testcases
      get :testsuites
      post :testsuites
      post :trigger
      post :triggertestsuite
      post :canceltask
      post :canceltasks
      get :submission
      get :submittestsuite
      post :triggertestsuites
      post :triggertestcases
    end
  end
  resources :schedules do
    collection do
      post :scheduletestcases
      post :scheduletestsuites
      get :testcases
      get :testsuites
    end
    member do
      get :testcase
      get :testsuite
      post :scheduletestcase
      post :scheduletestsuite
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
