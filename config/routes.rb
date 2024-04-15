Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  namespace :api do
    namespace :earthquakes do
      get "/" => "earthquake#index", as: :earthquake_data
    end
    namespace :comments do
      get "/" => "comment#index", as: :comment_by_earthquake
      post "/" => "comment#create", as: :save_comment
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
