Rails.application.routes.draw do
  resources :orders do
    member do
      put :start
      put :complete
    end
  end
  root "orders#index"
end
