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

    resources :projects, controller: 'developers/projects', only: %i[create] do
      get 'add', on: :collection
      delete 'delete', on: :member
    end

    resources :programming_languages, controller: 'developers/programming_languages', only: %i[create] do
      get 'add', on: :collection
      delete 'delete', on: :member
    end

    resources :frameworks, controller: 'developers/frameworks', only: %i[create] do
      get 'add', on: :collection
      delete 'delete', on: :member
    end
  end

  resources :employees do
    resources :tools, controller: 'employees/tools', only: %i[create] do
      get 'add', on: :collection
      delete 'delete', on: :member
    end

    resources :skills, controller: 'employees/skills', only: %i[create] do
      get 'add', on: :collection
      delete 'delete', on: :member
    end

    resources :educations, controller: 'employees/educations', only: %i[create] do
      get 'add', on: :collection
      delete 'delete', on: :member
    end

    resources :certificates, controller: 'employees/certificates', only: %i[create] do
      get 'add', on: :collection
      delete 'delete', on: :member
    end

    resources :employments, controller: 'employees/employments', only: %i[create] do
      get 'add', on: :collection
      delete 'delete', on: :member
    end
  end

  namespace :employees do
    post 'employee_tool/:id', to: 'employee_tools#update', as: 'update_tools'
    post 'employee_skill/:id', to: 'employee_skills#update', as: 'update_skills'
    post 'employee_education/:id', to: 'employee_educations#update', as: 'update_educations'
    post 'employee_certificate/:id', to: 'employee_certificates#update', as: 'update_certificates'
    post 'employee_employment/:id', to: 'employee_employments#update', as: 'update_employments'
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
