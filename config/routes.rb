Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_pages#top'
  get 'term', to: 'static_pages#term'
  get 'privacy', to: 'static_pages#privacy'
  get 'login', to: 'user_sessions#new'
  post'logout', to: 'user_sessions#destroy'

  resources :hotels do
    collection do
      get 'search'
    end
  end

  resources :users
  # Defines the root path route ("/")
  # root "articles#index"
end
