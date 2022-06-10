# frozen_string_literal: true

Rails.application.routes.draw do
  resources :frameworks
  resources :project_member_assignments
  resources :project_member_requests
  resources :contacts
  resources :project_coordinators
  resources :clients
  resources :developers do
    member do
      get 'detail'
      put 'reset_type/:id', to: 'developers#reset_type', as: 'reset_type'
    end
  end

  namespace :update_session do
    post 'update_session_project/:id', to: 'developer_updates#update_session_project'
    post 'update_session_programming_language/:id', to: 'developer_updates#update_session_programming_language'
    post 'update_session_framework/:id', to: 'developer_updates#update_session_framework'
    post 'update_session_tool/:id', to: 'developer_updates#update_session_tool'
    post 'update_session_skill/:id', to: 'developer_updates#update_session_skill'
    post 'update_session_education/:id', to: 'developer_updates#update_session_education'
    post 'update_session_employment/:id', to: 'developer_updates#update_session_employment'
    post 'update_session_certificate/:id', to: 'developer_updates#update_session_certificate'
  end

  resources :interns do
    member do
      put 'update_type/:id', to: 'interns#update_type', as: 'update_type'
    end
  end

  resources :projects
  resources :universities
  resources :programming_languages
  resources :tools
  resources :certificates
  resources :careers do
    resources :job_submissions
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :post_categories
  resources :posts
  resources :assignments
  resources :positions
  resources :skill_categories
  resources :skills
  resources :skill_category_groups
  resources :employees
  resources :item_types
  resources :items
  resources :item_histories
  get 'home', to: 'home#index'

  root 'home#index'
  namespace :api do
    namespace :v1 do
      resources :post_categories, path: 'post-categories' do
        member do
          get 'filter-post-by-category', to: :filter_post_by_category
        end

        collection do
          get 'category-list', to: :category_list
        end
      end

      resources :posts, only: %i[index show] do
        member do
          get 'related-posts', to: :related_posts
        end
      end

      resources :careers, only: %i[index show]
      resources :job_submissions
      resources :subscriptions
    end
  end
end
