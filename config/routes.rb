Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  api vendor_string: "member_miner", default_version: 1 do
    version 1 do
      cache as: 'v1' do
        get :search_caption, to: "main#search_caption"
        get :count, to: "main#count"
        get "ethnicity/:ethnicity/averages", to: "main#ethnicity_averages"
        get :social_habits, to: "main#social_habits"
      end
    end
  end
  root to: "admin/members#index"
end
