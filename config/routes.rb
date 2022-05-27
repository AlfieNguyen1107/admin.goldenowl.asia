Rails.application.routes.draw do
  resources :frameworks
  resources :project_member_assignments
  resources :project_member_requests
  resources :contacts
  resources :project_coordinators
  resources :clients do
    collection do
      get 'show-address-client', to: 'clients#show_address'
      get 'handler-address-client', to: 'clients#handler_address'
    end

    member do
      get 'show-address-client', to: 'clients#show_address'
      get 'handler-address-client', to: 'clients#handler_address'
    end
  end
  resources :developers do
    get 'detail', on: :member
  end
  resources :interns
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
  resources :employees do
    collection do
      get 'show-address-emp', to: 'employees#show_address'
      get 'handler-address-emp', to: 'employees#handler_address'
    end

    member do
      get 'show-address-emp', to: 'employees#show_address'
      get 'handler-address-emp', to: 'employees#handler_address'
    end
  end
  resources :item_types
  resources :items

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
