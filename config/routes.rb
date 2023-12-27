Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_pages#top'
  get 'term', to: 'static_pages#term'
  get 'privacy', to: 'static_pages#privacy'
  
  # Defines the root path route ("/")
  # root "articles#index"
end
