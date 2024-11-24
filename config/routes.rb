Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_pages#top'
  get 'term', to: 'static_pages#term'
  get 'privacy', to: 'static_pages#privacy'
  get '/login', to: 'user_sessions#new', as: :login
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy', as: :logout

  resources :hotels do
    collection do
      get 'search'
    end
  end

  resources :users, only: [:new, :create, :show, :edit]
  # Defines the root path route ("/")
  # root "articles#index"
end
