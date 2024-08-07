Rails.application.routes.draw do
  resources :restaurants, only: %i[index show new create] do
    member do
      get :reviews
    end
    resources :reviews, only: %i[create]
  end
end
