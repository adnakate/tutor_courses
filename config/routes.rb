Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :courses, only: [:create, :index]
      resources :tutors, only: [:create]
    end
  end
end
