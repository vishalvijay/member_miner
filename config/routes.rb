Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get :search_caption, to: "main#search_caption"
      get :count, to: "main#count"
      get "ethnicity/:ethnicity/averages", to: "main#ethnicity_averages"
      get :social_habits, to: "main#social_habits"
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "admin/members#index"
end
