Rails.application.routes.draw do
  api vendor_string: "member_miner", default_version: 1 do
    version 1 do
      cache as: 'v1' do
        resources :members, only: [] do
          collection do
            get :search_caption
          end
        end
      end
    end
  end
end
