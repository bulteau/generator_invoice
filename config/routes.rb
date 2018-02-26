Rails.application.routes.draw do
  root to: 'site#index'
    namespace :api do
      namespace :v1 do
        resources :invoices, only: [:index, :create, :destroy, :update] do
          collection do
            post 'simulator'
          end
        end
      end
    end
  end
