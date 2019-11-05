Rails.application.routes.draw do
  root to: 'users#tops'

  resources :users, except: [:index] do
    collection do
      get :tops
    end
  end

  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: %i[new create destroy]
end
