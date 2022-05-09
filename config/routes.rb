Rails.application.routes.draw do
  resources :university
  resources :programming_language
  resources :project_member_assignments
  resources :project_member_requests
  resources :contacts
  resources :project_coordinators
  resources :clients
  resources :developers do 
    get 'detail', on: :member
  end
  resources :interns
  resources :projects
  resources :teches
  resources :careers do
    resources :job_submissions
  end
  devise_for :users
  resources :post_categories
  resources :posts
  resources :assignments
  resources :positions, only: [:index]

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
