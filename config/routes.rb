Rails.application.routes.draw do
  resources :projects
  post "/rate" => "rater#create", :as => "rate"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  mount Sidekiq::Web => "/sidekiq" # monitoring console
  resources :profiles

  authenticated :user, ->(u) { u.recruiter? || u.admin? } do
    root "profiles#index", as: :root
  end
  root "home#index"
  match "*unmatched", to: "errors#route_not_found", via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
